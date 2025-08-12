  provider "aws" {
    region = "ap-south-1"
  
}


resource "aws_vpc" "MyVpc" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "public_subnet" {

  vpc_id     = aws_vpc.MyVpc.id
  cidr_block = "10.0.1.0/24"
  
  }

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.MyVpc.id
  cidr_block = "10.0.2.0/24"
  }
resource "aws_instance" "Instance1" {
  ami           = "ami-0ec73a27d7764e6b3"
  instance_type = "t2.micro"
  key_name = "mywindowskey"
  subnet_id = aws_subnet.public_subnet.id
 
} 
resource "aws_internet_gateway" "IG2" {
  vpc_id = aws_vpc.MyVpc.id
  }