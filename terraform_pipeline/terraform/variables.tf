variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0b5eea76982371e91"
}

variable "region" {
  type = list
  default = ["us-east-1", "us-east-2"]
}

variable "sg_protocols" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    self = bool
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      self = true
      cidr_blocks = [ "0.0.0.0/0", ]
    },
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0", ]
      self = false
    },

#  Ingress for the Oracle port, to connect via sqlplus
    {
      from_port = 5432
      to_port = 5432
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0", ]
      self = false
    },
  ]
}

variable "tf_foundation_role" {
  description = "Name of the Terraform Foundation role that has all admin privileges for deploying any AWS resources through IaC"
  type        = string
}

variable "management_account_id" {
  description = "Account Id for the management account for AWS"
  type        = string
}

variable "KEY_NAME" {
  type = string
  default = "id_rsa"
}

variable "PUB_KEY" {
  type = string
  default = "PUB_KEY"
}
variable "TAG_INSTANCE" {
  type = string
  default = ""
}

