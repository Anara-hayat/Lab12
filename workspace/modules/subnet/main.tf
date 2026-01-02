module "myapp_subnet" {
  source                 = "./modules/subnet"
  vpc_id                 = aws_vpc.myapp_vpc.id
  subnet_cidr_block      = var.subnet_cidr_block
  availability_zone      = var.availability_zone
  env_prefix             = var.env_prefix
  default_route_table_id = aws_vpc.myapp_vpc.default_route_table_id
}

resource "aws_instance" "myapp-server" {
  ami                    = "ami-0a0e5d9c7acc336f1"
  instance_type          = var.instance_type
  subnet_id              = module.myapp-subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.myapp_sg.id]
  key_name               = "serverkey"

  tags = {
    Name = "${var.env_prefix}-server"
  }
}
