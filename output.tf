output "iperf2_public_ip" {
  value = aws_eip.Iperf2_eip.public_ip
}

output "iperf2_public_dns" {
  value = aws_eip.Iperf2_eip.public_dns
}

output "iperf3_public_ip" {
  value = aws_eip.Iperf3_eip.public_ip
}

output "iperf3_public_dns" {
  value = aws_eip.Iperf3_eip.public_dns
}
