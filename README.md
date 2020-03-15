# aws-iperf-tf
To generate IPERF2 and IPERF3 servers in AWS for bandwidth testing and limit which public IPs can test against them.  The default region is us-east-1

## Set Variables
- Set variables in terraform.tfvars, (must set allowed_SSH_IP and allowed_IPERF_IP)

## Set aws secrets
### use enviroment variables
- export TF_VAR_access_key=foo
- export TF_VAR_secret_key=foo

### prompt for keys

### Create .tfvars file
- create a "terraformSecrets.auto.tfvars" and add to the file:
  - access_key = "foo"
  - secret_key = "foo"

## run terraform

- terraform init
- terraform plan
- terraform apply

After a run, the IPs and DNS names of your servers are shown

## Iperf documentation
- https://iperf.fr/iperf-doc.php

### Iperf2
Arista devices support Iperf2 natively on bash, using default Iperf port
- SSH into device
- 'bash'
- iperf -c <aws_eip.Iperf2_eip.public_ip>

### Iperf3
For client based tests using default Iperf3 port
- iperf3 -c <aws_eip.Iperf3_eip.public_ip> -p 5201

