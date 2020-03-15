variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

# #if you want to specify an ami in ec2.tf change to:  ami = var.ami
  default = "ami-0fc61db8544a617ed"
}

variable "Owner_Name" {
  default = "foo"
}

variable "allowed_SSH_IP" {
  type = list(string)
}

variable "allowed_IPERF_IP" {
  type = list(string)
}
variable "sshkey" {}

#if you want to specify an instance size change in ec2.tf change to: instance_type = var.instance_type
variable "instance_type" {
  default = "t3a.medium"
}

#if you want to specify an AZ in network.tf change availability_zone  = var.az
variable "az" {
  default = "us-east-1c"
}

