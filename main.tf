data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = var.ami_name_filter
  }

  owners = var.ami_owners
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  
  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_groups_ids

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size

    tags = var.tags
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}