resource "aws_instance" "ec2-demo1" {
  ami           = var.amzn-ami-id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "ec2-demo"
  }

  user_data                   = file("${path.module}/app1-install.sh")
  //user_data_replace_on_change = true

}
output "ec2-instance-public-ip" {
  description = "Print the public ip of the created EC2 instance"
  value       = aws_instance.ec2-demo1.public_ip
}

variable "instance_type" {
  default = "t2.micro"
  type    = string

}

variable "amzn-ami-id" {
  default = "ami-03a6eaae9938c858c"
  type    = string
}

variable "key_name" {
  type    = string
  default = "terraform-key1"
}