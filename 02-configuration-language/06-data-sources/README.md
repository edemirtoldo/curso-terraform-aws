# 📘 Data Sources no Terraform

Esta pasta demonstra como utilizar **data sources** no Terraform para consultar informações de recursos já existentes na AWS.

## O que são Data Sources?

- Permitem **ler dados de recursos existentes** (não criados pelo seu código Terraform).
- Úteis para buscar informações de recursos criados manualmente, por outros times ou módulos.

## Exemplos usados aqui

- [`data.aws_caller_identity.current`](data.tf): Consulta informações da conta AWS atual.
- [`data.aws_s3_bucket.caixa_do_edemir`](data.tf): Busca dados de um bucket S3 já existente.
- [`data.aws_dynamodb_table.tableName`](data.tf): Consulta uma tabela DynamoDB existente.

## Como funciona

1. **Defina o data source** no arquivo [`data.tf`](data.tf).
2. **Use os dados consultados** em outputs ([`outputs.tf`](outputs.tf)), locals ([`locals.tf`](locals.tf)), ou recursos.

## Diferença entre resource e data

| Bloco      | Finalidade                    | Exemplo                    |
| ---------- | ----------------------------- | -------------------------- |
| `resource` | Cria/gerencia recurso novo    | `resource "aws_s3_bucket"` |
| `data`     | Consulta recurso já existente | `data "aws_s3_bucket"`     |

##
