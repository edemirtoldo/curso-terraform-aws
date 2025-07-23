resource "aws_instance" "nodejs_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name   = "Ubuntu - ${var.environment}"
    Random = random_pet.this[0].id
  }
}
