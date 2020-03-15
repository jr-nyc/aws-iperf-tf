provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

#to select AZ in region being deployed
data "aws_availability_zones" "zones" {
  state = "available"
}
#to select instance type based off of regioin deployed in
data "aws_ec2_instance_type_offering" "instance" {

  filter {
    name   = "instance-type"
    values = ["t3.medium", "t2.medium", "t3a.medium", "t3.small"]
  }

  preferred_instance_types = ["t3.medium", "t3a.medium", "t2.medium", "t3.small"]

}

data "aws_ami" "iperf" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

}
