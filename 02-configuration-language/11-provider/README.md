# 🌍 Usando Múltiplos Providers no Terraform

Esta pasta demonstra como criar recursos em diferentes regiões AWS utilizando múltiplos providers e o meta-argumento `provider`.

## O que é o provider?

- O bloco `provider` define como o Terraform se conecta à AWS.
- É possível criar múltiplos providers usando o atributo `alias` para trabalhar com várias regiões ou contas.

## Exemplo prático

Aqui, dois buckets S3 são criados em regiões diferentes:

- **N. Virginia (`us-east-1`)**: Usando o provider padrão.
- **São Paulo (`sa-east-1`)**: Usando o provider com alias `sao_paulo`.

```hcl
provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"
}

provider "aws" {
  alias   = "sao_paulo"
  region  = "sa-east-1"
  profile = "tf_thinkpad_edemirtoldo"
}

resource "aws_s3_bucket" "bucket" {
  bucket   = "${data.aws_caller_identity.this.account_id}-${random_pet.this.id}"
  provider = aws
  # ...tags e configurações...
}

resource "aws_s3_bucket" "bucket_sao_paulo" {
  bucket   = "${data.aws_caller_identity.this.account_id}-${random_pet.this.id}-sp"
  provider = aws.sao_paulo
  # ...tags e configurações...
}
```

## Outputs

O arquivo [`outputs.tf`](outputs.tf) retorna os nomes dos buckets criados em cada região:

```hcl
output "buckets" {
  value = {
    n_virginia = aws_s3_bucket.bucket.id
    sao_paulo  = aws_s3_bucket.bucket_sao_paulo.id
  }
}
```

## Observações

- O nome do bucket é gerado dinamicamente para evitar conflitos.
- Se o bucket já existir, a AWS retorna erro `BucketAlreadyOwnedByYou`.
- Sempre utilize nomes únicos para buckets S3.

## Referências

- [Documentação oficial do provider](https://developer.hashicorp.com/terraform/language/providers/configuration)
-

- **N. Virginia (`us-east-1`)**: Usando o provider padrão.
- **São Paulo (`sa-east-1`)**: Usando o provider com alias `sao_paulo`.

```hcl
provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"
}

provider "aws" {
  alias   = "sao_paulo"
  region  = "sa-east-1"
  profile = "tf_thinkpad_edemirtoldo"
}

resource "aws_s3_bucket" "bucket" {
  bucket   = "${data.aws_caller_identity.this.account_id}-${random_pet.this.id}"
  provider = aws
  # ...tags e configurações...
}

resource "aws_s3_bucket" "bucket_sao_paulo" {
  bucket   = "${data.aws_caller_identity.this.account_id}-${random_pet.this.id}-sp"
  provider = aws.sao_paulo
  # ...tags e configurações...
}
```

## Outputs

O arquivo [`outputs.tf`](outputs.tf) retorna os nomes dos buckets criados em cada região:

```hcl
output "buckets" {
  value = {
    n_virginia = aws_s3_bucket.bucket.id
    sao_paulo  = aws_s3_bucket.bucket_sao_paulo.id
  }
}
```

## Observações

- O nome do bucket é gerado dinamicamente para evitar conflitos.
- Se o bucket já existir, a AWS retorna erro `BucketAlreadyOwnedByYou`.
- Sempre utilize nomes únicos para buckets S3.

## Referências

- [Documentação oficial do provider](https://developer.hashicorp.com/terraform/language/providers/configuration)
- [Meta-argumento provider](https://developer.hashicorp.com/terraform/language/meta-arguments/resource-provider)
