resource "aws_eip" "Iperf2_eip" {
  instance = aws_instance.Iperf2-Server.id
  vpc      = true
}

resource "aws_eip" "Iperf3_eip" {
  instance = aws_instance.Iperf3-Server.id
  vpc      = true
}

