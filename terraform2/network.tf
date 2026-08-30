resource "aws_vpc" "my_vpc" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = var.az # This is configured in variables.tf
  map_public_ip_on_launch = true # false if private subnet
  tags = {
    Name = "tf-subnet-public"
  }
}

# Here's for private subnet
# resource "aws_subnet" "my_private_subnet" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.20.2.0/24"
#   availability_zone       = var.az # This is configured in variables.tf
#   map_public_ip_on_launch = false
#   tags = {
#     Name = "tf-subnet-private"
#   }
# }

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "tf-igw"
  }
}
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "tf-rt-public"
  }
}
resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}
resource "aws_route_table_association" "my_link" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Here's for private subnet
# resource "aws_route_table" "my_private_route_table" {
#   vpc_id = aws_vpc.my_vpc.id
#   tags = {
#     Name = "tf-rt-private"
#   }
# }

# resource "aws_route_table_association" "my_private_link" {
#   subnet_id      = aws_subnet.my_private_subnet.id
#   route_table_id = aws_route_table.my_private_route_table.id
# }