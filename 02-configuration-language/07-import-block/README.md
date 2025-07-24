# 📦 Importando Recursos Existentes no Terraform

Esta pasta demonstra como **importar recursos já existentes na AWS** para o gerenciamento via Terraform, utilizando o bloco `import`.

## 🚀 Como funciona o bloco `import`

O bloco `import` permite que você traga recursos criados fora do Terraform (por exemplo, manualmente ou por outro sistema) para o estado do Terraform, tornando possível gerenciá-los daqui para frente.

### Exemplo prático

```hcl
import {
  to = aws_dynamodb_table.tabela_do_edemir
  id = local.table_name
}
```
