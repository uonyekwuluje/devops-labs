provider "aws" {
    region = var.AWS_REGION
}

terraform {
  backend "s3" {
    bucket         = "devenvlabs-terraform-tfstate"
    key            = "terraform/dev/terraform_dev.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devenvlabs_terraform_locks"
  }
}



#----------------------- Bastion Network Cluster --------------------------------
module "infra_network" {
  source = "./modules/aws-vpc"
  ssh_keypair = var.ssh_keypair
  network_name = var.network_name
  network_cidr = var.network_cidr
  project_suffix = var.project_suffix
  network_public_cidr_1 = var.network_public_cidr_1
  network_public_cidr_2 = var.network_public_cidr_2
  network_private_cidr_1 = var.network_private_cidr_1
  network_private_cidr_2 = var.network_private_cidr_2
  environment = var.environment
  aws_bastion_type = var.allpurpose_vm_size["vm_1_by_1"]
  aws_bastion_ami = var.aws_bastion_ami
}

output "public_subnet_one_id" {
  value = module.infra_network.public_subnet_one_id
}

output "public_subnet_two_id" {
  value = module.infra_network.public_subnet_two_id
}

output "private_subnet_one_id" {
  value = module.infra_network.private_subnet_one_id
}

output "private_subnet_two_id" {
  value = module.infra_network.private_subnet_two_id
}

output "vpc_id" {
  value = module.infra_network.vpc_id
}

output "bastion_public_ip_address" {
  value = module.infra_network.bastion_ip
}

output "bastion_ssh_connection" {
  value = "ssh -A ec2-user@${module.infra_network.bastion_ip}"
}
#--------------------------------------------------------------------------------------


# ----------------------------- Network Security Group ---------------------------------
module "security_groups" {
  source = "./modules/aws-security-groups"
  vpc_id = module.infra_network.vpc_id
}

output "base_ec2_security_group_id" {
  value = module.security_groups.vm_base_sg
}

output "elasticstack_security_group_id" {
  value = module.security_groups.elastic_sg
}
# --------------------------------------------------------------------------------------


# --------------------------------- Resource Groups -----------------------------------
module "infra_resource_groups" {
  source = "./modules/aws-resource-groups"
}
# -------------------------------------------------------------------------------------


## ---------------------------------- EC2 Instance Group --------------------------------
#module "pub_ec2_instance" {
#  source = "./modules/aws-ec2-pub"
#  ssh_keypair = var.ssh_keypair
#  server_name = "pub-server"
#  #node_count  =  var.pub_node_count
#  node_count  =  1
#  project_suffix = var.project_suffix
#  public_subnet_1_id = module.infra_network.public_subnet_one_id
#  public_subnet_2_id = module.infra_network.public_subnet_two_id
#  #aws_ami = var.aws_centos7_base_ami
#  aws_ami = var.aws_ubuntu18_base_ami
#  aws_type = var.allpurpose_vm_size["vm_1_by_1"]
#  security_group = module.security_groups.elastic_sg 
#  environment = var.environment
#  root_disk_size = var.disk_size
#}
#
#output "PUBServer_private_address" {
#  value = module.pub_ec2_instance.PUBLinux_private_address
#}
#
#output "PUBServer_public_address" {
#  value = module.pub_ec2_instance.PUBLinux_public_address
#}
#

#module "priv_ec2_instance" {
#  source = "./modules/aws-ec2-priv"
#  ssh_keypair = var.ssh_keypair
#  server_name = "priv-srv1"
#  node_count  =  1
#  #node_count  =  var.priv_node_count
#  project_suffix = var.project_suffix
#  private_subnet_1_id = module.infra_network.private_subnet_one_id
#  private_subnet_2_id = module.infra_network.private_subnet_two_id
#  #aws_ami = var.aws_centos7_base_ami
#  aws_ami = var.aws_ubuntu18_base_ami
#  aws_type = var.allpurpose_vm_size["vm_2_by_16"]
#  security_group = module.security_groups.elastic_sg
#  environment = var.environment
#  root_disk_size = var.disk_size
#}
#
#output "PrivateServer_private_address" {
#  value = module.priv_ec2_instance.PRIVLinux_private_address
#}


# ===================== EC2 SCALING ELB ===============================
module "ec2-elb-scaling" {
    source = "./modules/aws-ec2-scaling"
    ssh_keypair = var.ssh_keypair
    server_name = "webapp"
    node_count  =  2
    project_suffix = var.project_suffix
    public_subnet_1_id = module.infra_network.public_subnet_one_id
    public_subnet_2_id = module.infra_network.public_subnet_two_id
    aws_ami = var.aws_ubuntu18_base_ami
    aws_type = var.allpurpose_vm_size["vm_1_by_2"]
    security_group = module.security_groups.elastic_sg
    vpc_id = module.infra_network.vpc_id
}

# =====================================================================



# ============================== Spinnaker ==============================
##module "priv_ec2_instance" {
##  source = "./modules/aws-ec2-priv"
##  server_name = "halyard"
##  node_count  =  1
##  project_suffix = var.project_suffix
##  private_subnet_1_id = module.infra_network.private_subnet_one_id
##  private_subnet_2_id = module.infra_network.private_subnet_two_id
##  aws_ami = var.aws_ubuntu18_base_ami
##  aws_type = var.allpurpose_vm_size["vm_2_by_16"]
##  security_group = module.security_groups.elastic_sg
##  environment = var.environment
##  root_disk_size = var.disk_size
##}
##
##output "Spinnaker_private_address" {
##  value = module.priv_ec2_instance.PRIVLinux_private_address
##}
## ========================================================================
##
##
##module "priv_ec2_ebs_instance" {
##  source = "./modules/aws-ec2-ebs-priv"
##  server_name = "clientserver"
##  node_count  =  3
##  #node_count  =  var.priv_node_count
##  project_suffix = var.project_suffix
##  private_subnet_1_id = module.infra_network.private_subnet_one_id
##  private_subnet_2_id = module.infra_network.private_subnet_two_id
##  aws_ami = var.aws_centos7_base_ami
##  #aws_ami = var.aws_ubuntu18_base_ami
##  aws_type = var.allpurpose_vm_size["vm_2_by_4"]
##  security_group = module.security_groups.elastic_sg
##  environment = var.environment
##  root_disk_size = var.disk_size
##}
##
##output "PrivateServer_Client_private_address" {
##  value = module.priv_ec2_ebs_instance.PRIVLinux_private_address
##}
### --------------------------------------------------------------------------------------
#
#
## ============================= Kubernetes Cluster =====================================
#module "kubernetes_cluster" {
#  source = "./modules/aws-eks"
#  kubernetes_cluster_name = "uchdevk8cluster"
#  project_suffix          = var.project_suffix
#  public_subnet_1_id      = module.infra_network.public_subnet_one_id
#  public_subnet_2_id      = module.infra_network.public_subnet_two_id
#  private_subnet_1_id     = module.infra_network.private_subnet_one_id
#  private_subnet_2_id     = module.infra_network.private_subnet_two_id
#  vpc_id                  = module.infra_network.vpc_id
#  environment             = var.environment
#  kubernetes_version      = var.kubernetes_version
#  kubernetes_node_disk_size        = var.kubernetes_node_disk_size
#  kubernetes_instance_type         = var.kubernetes_instance_type
#  kubernetes_desired_node_size     = var.kubernetes_desired_node_size
#  kubernetes_desired_node_max_size = var.kubernetes_desired_node_max_size
#  kubernetes_desired_node_min_size = var.kubernetes_desired_node_min_size
#}
#
#output "eks_cluster_endpoint" {
#  value = module.kubernetes_cluster.eks_cluster_endpoint
#}
#
#output "eks_cluster_certificat_authority" {
#  value = module.kubernetes_cluster.eks_cluster_certificat_authority
#}
## =========================================================================================
