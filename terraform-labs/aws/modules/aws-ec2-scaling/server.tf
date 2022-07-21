resource "aws_security_group" "webapp1" {
  name = "autoscalling-twebapp-sg"
  vpc_id = var.vpc_id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating Launch Configuration
resource "aws_launch_configuration" "webapp_launch_config" {
  name_prefix = "webapp-"
  image_id               = var.aws_ami
  instance_type          = var.aws_type
  security_groups        = [var.security_group, aws_security_group.webapp1.id]
  key_name               = var.ssh_keypair
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get -y update
              sudo apt-get -y install nginx stress-ng
              EOF
  lifecycle {
    create_before_destroy = true
  }
}


# Creating AutoScaling Group
resource "aws_autoscaling_group" "webapp_asg" {
  name = "${aws_launch_configuration.webapp_launch_config.name}-asg"
  launch_configuration = aws_launch_configuration.webapp_launch_config.id
  min_size = 1
  desired_capacity     = 2
  max_size = 4

  vpc_zone_identifier  = [
     var.public_subnet_1_id,
     var.public_subnet_2_id
  ]
    
  #health_check_type = "EC2"
  health_check_type = "ELB"
  load_balancers = [
      aws_elb.webapp_elb.id
  ]


  force_delete      = true
  termination_policies  = ["OldestInstance"]

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  lifecycle {
      create_before_destroy = true
  }

  tag {
    key = "Name"
    value = "webapp-asg"
    propagate_at_launch = true
  }
}


## Schedule
#resource "aws_autoscaling_schedule" "webapp_schedule" {
#  scheduled_action_name  = "autoscalegroup_action"
#  min_size               = 1
#  max_size               = 2
#  desired_capacity       = 1
#  start_time             = timeadd(timestamp(), "30m") 
#  time_zone              = "US/Central"
#  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
#}

# Creating the autoscaling policy of the autoscaling group
resource "aws_autoscaling_policy" "webapp_policy_up" {
  name                   = "webapp_autoscalegroup_policy_up"
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
}

# Creating the AWS CLoudwatch Alarm that will autoscale the AWS EC2 instance based on CPU utilization.
resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
  alarm_name = "web_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "70"
  alarm_actions = [
        aws_autoscaling_policy.webapp_policy_up.arn
    ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_asg.name
  }
}



resource "aws_autoscaling_policy" "webapp_policy_down" {
  name = "webapp_policy_down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
}

resource "aws_cloudwatch_metric_alarm" "webapp_cpu_alarm_down" {
  alarm_name = "web_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "10"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ aws_autoscaling_policy.webapp_policy_down.arn ]
}





# Creating ELB
resource "aws_elb" "webapp_elb" {
  name = "webapp-asg"
  security_groups = [aws_security_group.webapp1.id]

  subnets = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]

  cross_zone_load_balancing = true
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
}
