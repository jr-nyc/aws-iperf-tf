resource "aws_instance" "Iperf2-Server" {
  ami           = data.aws_ami.iperf.id
  instance_type =  data.aws_ec2_instance_type_offering.instance.instance_type
  subnet_id     = aws_subnet.IPerf-Front.id
  #key_name          = var.sshkey
  user_data = <<-EOF
                #! /bin/bash
                wget https://iperf.fr/download/fedora/iperf-2.0.8-2.fc23.x86_64.rpm
                sudo yum -y install iperf-2.0.8-2.fc23.x86_64.rpm
                iperf -s
EOF


  tags = {
    Name = "Iperf2-${var.Owner_Name}"
  }

  security_groups = [aws_security_group.iperf-sg.id, aws_security_group.mgmt-sg.id]
}

resource "aws_instance" "Iperf3-Server" {
  ami           = data.aws_ami.iperf.id
  instance_type = data.aws_ec2_instance_type_offering.instance.instance_type
  subnet_id     = aws_subnet.IPerf-Front.id
  #key_name      = var.sshkey
  user_data = <<-EOF
                #! /bin/bash
                sudo yum update -y
                sudo yum -y install iperf3
                iperf3 -s
EOF


  tags = {
    Name = "Iperf3-${var.Owner_Name}"
  }

  security_groups = [aws_security_group.iperf-sg.id, aws_security_group.mgmt-sg.id]
}

