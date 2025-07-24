# 🔗 Usando o Meta-Argumento `depends_on` no Terraform

Esta pasta demonstra como utilizar o meta-argumento `depends_on` para controlar explicitamente a ordem de criação de recursos no Terraform.

## O que é o `depends_on`?

- Permite definir dependências explícitas entre recursos.
- Garante que um recurso só será criado/modificado após outro estar pronto.
- Útil quando a dependência não é detectada automaticamente pelo Terraform.

## Exemplo prático

Aqui, criamos um usuário IAM e um bucket S3. O recurso de **attachment de política** do usuário depende explicitamente do bucket S3:

```hcl
resource "aws_iam_user_policy_attachment" "example" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  user       = aws_iam_user.example.name

  depends_on = [aws_s3_bucket.bucket]
}
```

- O `depends_on` garante que o bucket S3 será criado antes do attachment da política ao usuário IAM.

## Outros recursos usados

- [`random_pet`](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet): Gera um nome aleatório para o bucket.
- `data "aws_caller_identity"`: Consulta informações da conta AWS.
- Outputs: Exibe o nome do bucket criado.

## Como testar

1. Execute `terraform apply` para ver a ordem de criação dos recursos.
2. Remova ou altere o `depends_on` para observar o comportamento padrão do Terraform.
