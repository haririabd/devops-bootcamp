data "aws_ami" "my_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

module "node1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"
  name                   = "node1"
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.public_subnets[0]
  create_security_group  = false
  vpc_security_group_ids = [module.my_sg.id]
  key_name               = "Zenbook-Hariri"
  tags                   = { Name = "node1" }
  root_block_device      = { size = 16 }
}

module "node2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"
  name                   = "node2"
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.public_subnets[0]
  create_security_group  = false
  vpc_security_group_ids = [module.my_sg.id]
  key_name               = "Zenbook-Hariri"
  tags                   = { Name = "node2" }
  root_block_device      = { size = 16 }
}