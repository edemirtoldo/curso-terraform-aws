## Explicação Básica do Terraform `main.tf` (com exemplo AWS S3)

### 1. Bloco `terraform`

Define os **providers necessários** e suas versões para o projeto.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

### 2. Bloco provider

Configura detalhes da conexão com a AWS.

```hcl
provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"
}
```

### 3. Bloco resource

Cria recursos na infraestrutura.

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "o-bucket-do-edemir-criado-no-terraform-em-2025-07"

  tags = {
    CreatedAt = "2025-07-22"
    ManagedBy = "Terraform"
  }
}
```

- Cria um bucket S3 com nome fixo.

- Adiciona tags para identificar o recurso.

### 4. Recurso relacionado (versionamento do bucket)

```hcl
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}
```

- Habilita versionamento no bucket criado.

- Referencia o bucket criado antes usando aws_s3_bucket.example.id.

### Resumo do fluxo básico

1. Configura o provider para AWS.

2. Define recursos que quer criar.

3. Executa terraform init para baixar providers.

4. Executa terraform apply para criar os recursos declarados.

[!NOTE]

> 💡 Projeto mantido por [Edemir Toldo](https://www.linkedin.com/in/edemirtoldo/)
