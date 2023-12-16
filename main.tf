provider "aws" {
          region = "ap-south-1"

}

resource "aws_s3_bucket" "project-bucket" {
        bucket = "my-tws-task"
 }

resource "aws_instance" "project_instance" {
          ami = var.ec2-ubuntu-ami
          instance_type = "t2.micro"
          tags = {
           Name = "terra-AWS-instance"
}
}
