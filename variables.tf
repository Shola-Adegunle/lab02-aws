////// NETWORKING //////
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "terraform-vcp"
}

variable "private_web_sub1_cidr" {
  type = string
  default = "10.0.3.0/24"
}

////// EC2 INSTANCE //////
variable "region" {
  type        = list(string)
  description = "region of the instance to be created"
  default     = ["us-east-1", "us-west-1", "us-west-2"]
}

variable "instance_type" {
  type        = map(string)
  description = "instance type to use"
  default = {
    small  = "t2.micro"
    medium = "t2.medium"
    large  = "t2.large"
  }
}

variable "key_pair_name" {
  type        = string
  description = "private key name"
  default     = "terraform-admin-key"
  sensitive   = true
}