# ⚙️ Usando o Meta-Argumento `lifecycle` no Terraform

Esta pasta demonstra como utilizar o meta-argumento `lifecycle` para controlar o comportamento de criação, atualização e destruição de recursos no Terraform.

## Principais funcionalidades do `lifecycle`

- **prevent_destroy**: Impede que o recurso seja destruído por acidente.
- **create_before_destroy**: Garante que um novo recurso seja criado antes de destruir o antigo (útil para evitar downtime).
- **ignore_changes**: Ignora alterações em atributos específicos, evitando atualizações desnecessárias.
- **replace_triggered_by**: Força a substituição do recurso quando outro recurso ou arquivo muda.
- **precondition/postcondition**: Permite validar condições antes e depois da criação do recurso.

## Exemplos práticos

### DynamoDB Table

```hcl
resource "aws_dynamodb_table" "users" {
  name         = "users-${random_pet.this.id}"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  lifecycle {
    prevent_destroy = false
  }
}
```

- O bloco `lifecycle` controla se a tabela pode ser destruída.

### EC2 Instance com gatilho de substituição

```hcl
resource "null_resource" "replacement_trigger" {
  triggers = {
    "startup_script" = filesha256("user_data.sh")
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  user_data     = filebase64("user_data.sh")
  tags = { Name = "Ubuntu" }

  lifecycle {
    create_before_destroy = true
    replace_triggered_by  = [null_resource.replacement_trigger]
    ignore_changes        = [tags]
    precondition {
      condition     = data.aws_ami.ubuntu.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
    postcondition {
      condition     = self.public_dns != ""
      error_message = "EC2 instance must be in a VPC that has public DNS hostnames enabled."
    }
  }
}
```

- O recurso EC2 será recriado se o script de inicialização (`user_data.sh`) mudar.
- Validações garantem que a AMI e a configuração de DNS estejam corretas.

## Como testar

1. Altere o arquivo `user_data.sh` e execute `terraform apply` para ver o EC2 ser substituído.
2. Modifique atributos ignorados para ver que não causam atualização.
3. Tente destruir recursos para testar o `prevent_destroy`.

## Referências

- [Documentação oficial do lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)
