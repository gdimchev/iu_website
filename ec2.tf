resource "aws_instance" "myfirstinstance_1c" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "FirstInstance"
  vpc_security_group_ids = ["sg-02775ecf3038eec4b"]
  tags = {
    Name = "MyFirstInstance_1c"
  }
}
