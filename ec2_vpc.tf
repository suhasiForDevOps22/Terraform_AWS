resource "aws_key_pair" "projectkey" {
        key_name = "terra-project-key"
        public_key = file("/home/ubuntu/.ssh/terra-project-key.pub")
}
resource "aws_default_vpc" "default_vpc" {

}


resource "aws_security_group" "allow_ssh" {
        name= "allow_ssh"
        description= "Allow ssh inbound traffic"
        vpc_id = aws_default_vpc.default_vpc.id

        ingress {
         description = "TLS from VPC"
         protocol = "tcp"
         from_port = 22
         to_port = 22
         cidr_blocks = ["0.0.0.0/0"]
}

        tags = {
     Name = "allow_ssh"
}
}
resource "aws_instance" "project-vpc-instance" {
        key_name = aws_key_pair.projectkey.key_name
        ami = var.ec2-ubuntu-ami
        instance_type = "t2.micro"
        security_groups = [aws_security_group.allow_ssh.name]



        tags = {
        Name = "Secured-project-instance"
}
}

