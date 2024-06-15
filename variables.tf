variable "name" {
  type = string
  description = "The name of the EC2 Instance"
}
variable "key_name" {
  type = string
  description = "The name of the key that will be used to access the instance via SSH"
}
# WARNING: If you don't set the subnet id, terraform will pick the first one it encouters from the VPC which may lead to 
# security issues like having a public ip when you don't need one. I recommend you to set the subnet id.
variable "subnet_id" {
  type = string
  description = "The id of the subnet to use"
}
variable "security_groups_ids" {
  type = list(string)
  description = "List of security groups ids to use"
}
variable "instance_type" {
  type = string
  description = "The instance type to use. Ej: t3.micro"
}
variable "volume_size" {
  type = number
  description = "The number of gigs the volume will have"
}
variable "volume_type" {
  type = string
  default = "gp3"
  description = "The type of volume this instance will use."
}
variable "ami_name_filter" {
  type = list(string)
  default = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  description = "The list of source of image to use. You will find this in EC2 -> AMIs -> Public images (Top left)"
}
variable "ami_owners" {
  type = list(string)
  default = ["099720109477"] # Canonical
  description = "The owner of the image to use. You will find this in the exact place as ami_name_filter."
}
variable "tags" {
  description = "Tags to apply to the Security Group"
  type        = map(string)
  default     = {}
}