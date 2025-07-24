# 🧩 Guia de Interpolação no Terraform

## Quando e como usar interpolação no Terraform, com exemplos claros e boas práticas.

## ✅ O que é interpolação?

Interpolação em Terraform permite **inserir dinamicamente valores dentro de strings**. É feita com a sintaxe `${...}` e pode referenciar:

- Variáveis (`var.nome`)
- Atributos de recursos (`aws_instance.exemplo.id`)
- Data sources (`data.aws_ami.ubuntu.id`)
- Funções (`join()`, `format()`, etc.)

## 🔍 Quando usar interpolação

### ✔️ Concatenar variáveis com texto

```hcl
bucket = "${var.prefix}-meu-bucket"
```

### ✔️ Construir strings dinâmicas

```hcl
output "url" {
  value = "https://${aws_s3_bucket.meu_bucket.bucket}.s3.amazonaws.com"
}
```

### ⚠️ Quando NÃO usar interpolação (Terraform 0.12+)

Desde o Terraform 0.12, interpolação em valores simples não é mais necessária.

❌ Evite:

```hcl
name = "${var.nome}"
```

✅ Prefira:

```hcl
name = var.nome
```

### 📌 Resumo

| Situação                           | Usar Interpolação? | Exemplo                              |
| ---------------------------------- | ------------------ | ------------------------------------ |
| Concatenar string + variável       | ✅ Sim             | `"bucket-${var.nome}"`               |
| Atribuir valor simples diretamente | ❌ Não             | `name = var.nome`                    |
| Expressão dentro de string         | ✅ Sim             | `"${var.env}-${var.project}"`        |
| Apenas referenciar atributo ou ID  | ❌ Não             | `ami = data.aws_ami.amazon_linux.id` |

### 🧪 Exemplo completo

```hcl
variable "env" {
  default = "dev"
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket = "${var.env}-meu-bucket" # string dinâmica

  tags = {
    Name = var.env                 # sem interpolação
  }
}

output "bucket_url" {
  value = "https://${aws_s3_bucket.meu_bucket.bucket}.s3.amazonaws.com"
}
```

## 💡 Dicas finais

- Use interpolação apenas em strings compostas.

- Para valores diretos, prefira a sintaxe simples (var.algo).

- Interpolação excessiva pode deixar o código confuso e redundante.
