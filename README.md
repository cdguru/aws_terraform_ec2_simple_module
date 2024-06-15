# AWS Terraform EC2 Instance Module (simple)

This module allows you to create an AWS EC2 very easily. In the near future i will be making an advance module where we could set almost all parameters available for an EC2 instance. The objective of this particular module is to keep it simple and fast.

## Usage

You can always check [variables.tf](variables.tf) for more details and understanding. Also, you can check these practical [examples](examples/) 😃

You can visit this [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html) to know more about EC2 (Elastic Compute Cloud).

```hcl
module "ec2" {
  source      = "git::https://github.com/cdguru/aws_terraform_ec2_simple_module.git?ref=v1.0"
  
  name                = <string>
  
  key_name            = <string>

  subnet_id           = <string>

  security_groups_id  = <list of strings>

  instance_type       = <string>

  volume_size         = <integer>

  volume_type         = <string>

  ami_name_filter     = <list of strings>
  
  ami_owners          = <list of strings>

  [OPTIONAL]
  tags                = <map of strings>
}
```