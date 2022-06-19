variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC18Yv8qFdV8+uo5c3EHFx8/fqm/LO9FZ9BG0v8pEKOfFSBeiivnwjQyG4CJq9v6UZBRzF7BypyzeTLtW8X61aHR+y0pRlIepy5rhFLmGZ4g9KxQUIYhUcAzMSISBYJtaBAOaj/7+gUZJzosE/R0wmzxcgC2Js0NU0zrOsgt505PsWSctd5ugAkQk/XHiNovj+CUNPORf4laxD8sHXkbkVm05x1dwzrbLxdeChabJV599Bbn4q3EzJoo+AgpV8YYOoDX5YuAhzzpBpxNs0cbHuNG14NldLoeBSK8XKhI1q4mpZNRO4YKvabkqWzY0T/lEWz8bDhNAqE06hB7mZ3mYJv terraform-infra"
}
  
variable "proxmox_host" {
  default = "prx01"
}
  
variable "template_name" {
  default = "centos7-template"
}

variable "username" {
  default = "admin"
}

variable "password" {
  default = "password"
}

variable "prx_address" {
  default = "192.168.1.143"
}

variable "prx_port" {
  default = "8006"
}

variable "prx_username" {
  default = "root@pam"
}

variable "prx_password" {
  default = "password"
}
