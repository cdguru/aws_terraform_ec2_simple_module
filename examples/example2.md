# Example of use for the EC2 module (simple) #2

In this example you will create an EC2 instance. You will also use another module to provide our instance with a security group so we can connect using ssh and deploy our beautiful web site.

- First we will create the Security group for our instance
- After the SG, we will create our instance using the output of our previously created Security group.

```hcl
module "sg" {
  source = "git::https://github.com/cdguru/aws_terraform_sg_module.git?ref=v1.2"

  name = "Web server SG"

  vpc_id = "vpc-0344ddd18fbbb5d3e"
  
  ingress_map = [
    
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "6"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "6"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "6"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Service = "web_server"
  }
}

module "ec2" {
  source = "git::https://github.com/cdguru/aws_terraform_ec2_simple_module.git?ref=v1.0"

  subnet_id = "subnet-01234abcdf0f48109"

  key_name = "MyKey"
  volume_size = 50
  name = "Web_Server"
  instance_type = "t3.small"

  security_groups_ids = [ module.sg.sg_id ]

  tags = {
    Service = "web_server"
  }  
}
```