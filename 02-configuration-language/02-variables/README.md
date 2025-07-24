## 🎛️ Variáveis no Terraform

Variáveis permitem **parametrizar seu código Terraform**, facilitando reutilização e customização.

### Como declarar variáveis

```hcl
variable "nome_da_variavel" {
  type        = string       # tipo (string, number, bool, list, map, etc.)
  default     = "valor"      # valor padrão (opcional)
  description = "Descrição da variável"
  sensitive   = true         # oculta valor em logs (opcional)
}
```

### Como usar variáveis

```hcl
resource "aws_s3_bucket" "exemplo" {
  bucket = var.nome_da_variavel
}
```

### Passando valores para variáveis

- Arquivo terraform.tfvars ou \*.auto.tfvars

- Linha de comando: terraform apply -var="nome_da_variavel=valor"

- Variáveis de ambiente: TF_VAR_nome_da_variavel=valor

- Diretamente no arquivo .tf

| Tipo     | Descrição                     |
| -------- | ----------------------------- |
| `string` | Texto simples                 |
| `number` | Números                       |
| `bool`   | Booleanos (`true`/`false`)    |
| `list`   | Lista ordenada                |
| `map`    | Mapa (dicionário chave-valor) |

### Dicas rápidas

- Sempre defina `description` para melhor documentação

- Use `sensitive = true` para dados confidenciais

- Combine variáveis com `locals` para organizar valores derivados
