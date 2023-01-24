provider "aws" {
  region = var.region[1]
    assume_role {
    role_arn     = format("arn:aws:iam::%s:role/%s", var.management_account_id, var.tf_foundation_role)
    session_name = "tf-admin"
  }
}

resource "aws_instance" "postgres_instance" {
   ami = var.ami_id
   instance_type = var.instance_type
   key_name= var.KEY_NAME
   vpc_security_group_ids = [aws_security_group.main.id]
  #  provisioner "file" {
  #   source      = "ec2-user-data.sh"
  #   destination = "/tmp/ec2-user-data.sh"
  # }
  #  provisioner "remote-exec" {
  #    inline = [
  #     "chmod +x /tmp/ec2-user-data.sh",
  #     "/tmp/ec2-user-data.sh",
  #   ]
  # }
  #  connection {
  #     type        = "ssh"
  #     host        = self.public_ip
  #     user        = "ec2-user"
  #     agent       = true
  #     //private_key = file("/Users/sebastianzumbado/AWS_Certified_Dev/terraform_aws/.ssh/id_rsa")
  #     timeout     = "4m"
  #  }
   # root disk
  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    delete_on_termination = true
  }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "30"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = var.TAG_INSTANCE
  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 dynamic ingress {
   for_each = var.sg_protocols
   content{
     cidr_blocks      = ingress.value["cidr_blocks"]
     from_port        = ingress.value["from_port"]
     protocol         = ingress.value["protocol"]
     self             = ingress.value["self"]
     to_port          = ingress.value["to_port"]
    } 
  }
}

# resource "aws_ebs_volume" "ora_volume" {
#   availability_zone = "us-east-2a"
#   size              = 20
#   tags = {
#     Name = var.TAG_INSTANCE
#   }
# }

resource "aws_key_pair" "key_pair" {
  key_name   = var.KEY_NAME
  public_key = var.PUB_KEY
}
# https://jhooq.com/terraform-ssh-into-aws-ec2/

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.postgres_instance.public_ip
}