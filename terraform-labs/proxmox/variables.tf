variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFRUNQTiSWreSYQL2qD7wUSPt6rP7g0S1SOMInljoPZ7rNECnUwc4+ye2MjTpwi/U9673lfBRXaxmySgh3H9NtJe32dr20BHYPh3sqNW5+lDXBenIsAz5DEtNZBZao854GVOtYN5wd0TUulbwWwy0+BUsZpLbOZv1W/Ju0TsgDUnhxPEtgKvXYgXYiGn5VziU0WyW/BmjD3uTQuFe06UxEyEQr0KSg/D/NB0cI0XluIVeOj5ZJzjzAM1S36GRdBZn7sqt0YSFdLoQ8g6nisHbGcbIshW9MzI+PSb/d2YxU1lD/rBx8A/Fvjg25E4ccnPzsOMnkSJDbYTKL62KNPK81 terraform-infra"
}
  
variable "proxmox_host" {
  default = "prx01"
}
  
variable "template_name" {
  default = "amalinux8-template"
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
