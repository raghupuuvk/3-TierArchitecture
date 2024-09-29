variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "key_pair" {
  description = "EC2 Key Pair name"
  type = string
  default = "04May2024"
}

variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "aws_region2" {
  description = "AWS Region 2"
  type = string
  default = "us-east-2"
}