variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0fa49cc9dc8d62c84"
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
      from_port = 1521
      to_port = 1521
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0", ]
      self = false
    },
  ]
}

variable "AWS_ACCESS_KEY_ID" {
  type = string
  default = "AWS_ACCESS_KEY"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  default = "AWS_SECRET"
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

