## 📍 Locals no Terraform

**Locals** são variáveis internas usadas para **armazenar valores intermediários ou reutilizáveis** dentro de um módulo, melhorando a legibilidade e evitando repetição.

### Como definir locals

````hcl
locals {
  nome_local = "valor"
  outro_local = "${var.prefix}-suffix"
}

### Como usar

```hcl
resource "aws_s3_bucket" "exemplo" {
  bucket = local.nome_local
}
````

### Por que usar locals?

- Evitar repetição de expressões complexas

- Melhorar organização do código

- Facilitar manutenção e alterações futuras

- Agrupar valores derivados de variáveis ou dados externos

### Exemplo prático

```hcl
locals {
  env       = var.environment
  full_name = "${local.env}-meu-projeto"
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket = local.full_name
}
```

### Dicas rápidas

- Locals são imutáveis (não podem ser alterados após definição)

- Use para cálculos, concatenações e formatos reutilizados

- Não são expostos fora do módulo (diferente de outputs)
