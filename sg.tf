resource "aws_security_group" "mgmt-sg" {
  name        = "mgmt-sg"
  description = "for SSH access"
  vpc_id      = aws_vpc.Iperf.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    # Restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = flatten([var.allowed_SSH_IP])
  }

  egress {
    description = "Default Out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "iperf-sg" {
  name        = "iperf-sg"
  description = "for IPERF"
  vpc_id      = aws_vpc.Iperf.id

  ingress {
    description = "IPERF in"
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = flatten([var.allowed_IPERF_IP])
  }

  ingress {
    description = "IPERF3 in"
    from_port   = 5201
    to_port     = 5201
    protocol    = "tcp"
    cidr_blocks = flatten([var.allowed_IPERF_IP])
  }

  egress {
    description = "Default Out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
