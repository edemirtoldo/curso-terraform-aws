# ☁️ Backend Remoto com S3 e DynamoDB no Terraform

Esta pasta demonstra como criar a infraestrutura necessária para armazenar o **estado remoto do Terraform** na AWS, utilizando um bucket S3 e uma tabela DynamoDB para locking.

## O que é remote state?

- O **remote state** permite que o arquivo de estado do Terraform (`terraform.tfstate`) seja armazenado de forma centralizada e segura, facilitando o trabalho em equipe e evitando conflitos.
- O S3 armazena o estado, enquanto a tabela DynamoDB é usada para **lock** (evitar que múltiplos usuários modifiquem o estado ao mesmo tempo).

## Recursos criados

- **Bucket S3**: Armazena o arquivo de estado remoto.
- **Versionamento no S3**: Garante histórico e recuperação de versões do estado.
- **Tabela DynamoDB**: Gerencia locks do estado remoto.

## Principais arquivos

- [`main.tf`](main.tf): Configuração do provider AWS e tags padrão.
- [`s3.tf`](s3.tf): Criação do bucket S3 e habilitação do versionamento.
- [`dynamodb.tf`](dynamodb.tf): Criação da tabela DynamoDB para locking.
- [`outputs.tf`](outputs.tf): Exporta os nomes e ARNs do bucket e da tabela DynamoDB.
- [`versions.tf`](versions.tf): Define as versões do Terraform e do provider AWS.

## Como usar

1. **Execute `terraform apply`** nesta pasta para criar o bucket e a tabela DynamoDB.
2. Use os outputs para configurar o backend remoto em outros projetos Terraform, por exemplo:

```hcl
terraform {
  backend "s3" {
    bucket         = "tfstate-2025-<account_id>"
    key            = "caminho/para/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tflock-tfstate-2025-<account_id>"
  }
}
```

## Referências

- [Remote State com S3](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
- [Locking com DynamoDB](https://developer.hashicorp.com/terraform/language/settings/backends/s3#dynamodb-table-locking)
