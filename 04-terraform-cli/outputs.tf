output "instance" {
  value = {
    id  = aws_instance.nodejs_server.id
    arn = aws_instance.nodejs_server.arn
  }
}

output "pet" {
  value = random_pet.this[0].id
}
