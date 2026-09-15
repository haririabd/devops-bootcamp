data "aws_ami" "my_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

data "aws_iam_instance_profile" "my_ssm_profile" {
  name = "EC2-SSM-Role"
}

module "webserver" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"
  name                   = "webserver"
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.public_subnets[0]
  create_security_group  = false
  vpc_security_group_ids = [module.devops-public-sg.id]
  key_name               = "Zenbook-Hariri"
  tags                   = { Name = "webserver" }
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name
#   root_block_device      = { size = 16 }
}

resource "aws_eip" "webserver" {
  domain   = "vpc"
  instance = module.webserver.id
  tags     = { Name = "webserver-eip" }
}

module "controller" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"
  name                   = "controller"
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.private_subnets[0]
  create_security_group  = false
  vpc_security_group_ids = [module.devops-private-sg.id]
  key_name               = "Zenbook-Hariri"
  tags                   = { Name = "controller" }
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name
#   root_block_device      = { size = 16 }
}

module "monitor" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"
  name                   = "monitor"
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.private_subnets[0]
  create_security_group  = false
  vpc_security_group_ids = [module.devops-private-sg.id]
  key_name               = "Zenbook-Hariri"
  tags                   = { Name = "monitor" }
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name
#   root_block_device      = { size = 16 }
}