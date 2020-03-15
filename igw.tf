resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Iperf.id

  tags = {
    Name = "Iperf-igw"
  }
}

