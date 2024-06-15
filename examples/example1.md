# Example of use for the EC2 module (simple) #1 

In this example you will create two EC2 instance at once... Just because we can. 

Of course, we will use different subnets to have each instance on a different AZ.

```hcl
module "ec2" {
  source = "git::https://github.com/cdguru/aws_terraform_ec2_simple_module.git?ref=v1.0"

  subnet_id = "subnet-01234abcdf0f48109"
  security_groups_ids = ["sg-054999696ad95xxxx"]

  key_name = "MyKey"
  volume_size = 50
  name = "App_Node_1"
  instance_type = "t3.small"

  tags = {
    Service = "My_Cluster1"
  }  
}

module "ec2" {
  source = "git::https://github.com/cdguru/aws_terraform_ec2_simple_module.git?ref=v1.0"

  subnet_id = "subnet-dcba43210f0f48109"
  security_groups_ids = ["sg-054999696ad95xxxx"]

  key_name = "MyKey"
  volume_size = 50
  name = "App_Node_2"
  instance_type = "t3.small"

  tags = {
    Service = "My_Cluster1"
  }  
}

```