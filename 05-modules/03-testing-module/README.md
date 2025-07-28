# 🌐 Testando Módulo de Static Website S3 no Terraform

Esta pasta demonstra como **testar e consumir um módulo customizado** para provisionar um bucket S3 configurado como site estático, com upload de arquivos e permissões públicas.

---

## 📦 O que está implementado?

- Consumo do módulo criado em `../02-creating-modules` para provisionar um bucket S3.
- O bucket é configurado como site estático, com arquivos HTML de exemplo enviados automaticamente.
- Permissões públicas são aplicadas para acesso ao conteúdo do site.
- Versionamento do bucket ativado.
- Outputs expõem a URL do site.

---

## 🗂️ Estrutura dos arquivos

```
.
├── main.tf           # Provider, random_pet e configurações globais
├── website.tf        # Consumo do módulo S3 para site estático
├── outputs.tf        # Output da URL do site
├── versions.tf       # Versões do Terraform, providers e backend remoto
├── website/
│   ├── index.html    # Página principal do site
│   └── error.html    # Página de erro personalizada
```

---

## 🚀 Como funciona

- O arquivo [`website.tf`](website.tf) consome o módulo `../02-creating-modules`, passando:

  - Nome único para o bucket (`terraform-${random_pet.this.id}`)
  - ACL pública e política para leitura pública dos objetos
  - Configuração de acesso público liberado
  - Versionamento ativado
  - Upload dos arquivos da pasta `website/` (index.html e error.html)
  - Configuração do site estático (index e error document)

- O output [`outputs.tf`](outputs.tf) expõe a URL do site provisionado:
  ```hcl
  output "website_url" {
    value = module.s3_static_website.website
  }
  ```

---

## 💡 Observações

- O módulo utilizado permite customizar ACL, políticas, versionamento, website e upload de arquivos.
- Os arquivos HTML de exemplo podem ser alterados livremente para testar o site.
- O backend remoto S3/DynamoDB garante colaboração e histórico do estado.

---

## 📚 Referências

- [Documentação oficial de módulos](https://developer.hashicorp.com/terraform/language/modules)
- [aws_s3_bucket como site estático](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#website)
