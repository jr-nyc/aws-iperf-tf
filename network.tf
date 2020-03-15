resource "aws_vpc" "Iperf" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Iperf"
  }
}

resource "aws_subnet" "IPerf-Front" {
  vpc_id            = aws_vpc.Iperf.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.zones.names[0]

  tags = {
    Name = "IPerf-Front"
  }
}

resource "aws_route_table" "route-table-iperf" {
  vpc_id = aws_vpc.Iperf.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.IPerf-Front.id
  route_table_id = aws_route_table.route-table-iperf.id
}