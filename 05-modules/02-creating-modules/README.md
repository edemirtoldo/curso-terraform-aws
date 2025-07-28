# 🏗️ Criando Módulos Reutilizáveis no Terraform

Esta pasta demonstra como **criar um módulo customizado** no Terraform para provisionar buckets S3 com diversas opções de configuração e upload de arquivos.

---

## 📦 O que este módulo faz?

- Cria um bucket S3 com configurações flexíveis (ACL, versionamento, logging, website, política, etc).
- Permite configurar controle de acesso, versionamento, logging, site estático e políticas customizadas.
- Permite upload de múltiplos arquivos para o bucket, com detecção automática de Content-Type.
- Expõe diversos outputs úteis para integração com outros módulos ou projetos.

---

## 🗂️ Estrutura dos arquivos

```
.
├── main.tf           # Lógica principal do bucket S3 e recursos auxiliares
├── variables.tf      # Variáveis de entrada para customização do módulo
├── outputs.tf        # Outputs do módulo (ARN, nome, endpoints, objetos, etc)
├── locals.tf         # Locais auxiliares para lógica condicional
└── modules/
    └── object/
        ├── main.tf        # Lógica para upload de arquivos ao bucket
        ├── variables.tf   # Variáveis para upload de arquivos
        └── outputs.tf     # Outputs dos objetos enviados
```

---

## 🚀 Como usar este módulo

Você pode consumir este módulo em outro projeto ou módulo, por exemplo:

```hcl
module "s3_reports" {
  source = "../02-creating-modules"
  name   = "meu-bucket-reports"
  acl    = "private"
  versioning = {
    status = "Enabled"
  }
  website = {
    index_document = "index.html"
  }
  filepath = "caminho/para/arquivos"
}
```

---

## 🏷️ Principais variáveis de entrada

- `name`: Nome único do bucket.
- `acl`: Controle de acesso (ex: "private", "public-read").
- `ownership`: Controle de ownership dos objetos.
- `policy`: Política customizada para o bucket.
- `force_destroy`: Permite destruir o bucket mesmo com objetos.
- `versioning`: Configuração de versionamento.
- `public_access`: Configuração de bloqueio de acesso público.
- `website`: Configuração de site estático.
- `logging`: Configuração de logging.
- `filepath`: Caminho local para upload de arquivos.
- `key_prefix`: Prefixo para os arquivos enviados.

Veja todos os detalhes em [`variables.tf`](variables.tf).

---

## 🟢 Outputs disponíveis

- `arn`: ARN do bucket.
- `name`: Nome do bucket.
- `regional_domain_name`: Endpoint regional.
- `domain_name`: Endpoint global.
- `website`: Endpoint do site estático (se configurado).
- `website_domain`: Domínio do site estático.
- `hosted_zone_id`: Hosted zone do bucket.
- `objects`: Lista dos arquivos enviados ao bucket.

Veja todos os detalhes em [`outputs.tf`](outputs.tf).

---

## ⚙️ Submódulo: Upload de arquivos

O subdiretório [`modules/object`](modules/object/) implementa o upload de arquivos para o bucket, detectando o Content-Type automaticamente com base na extensão.

---

## 💡 Observações

- O módulo valida valores de entrada para evitar erros comuns.
- O uso de `locals` permite lógica condicional para recursos opcionais.
- Pode ser facilmente estendido para outros tipos de configuração de bucket S3.

---

## 📚 Referências

- [Documentação oficial de módulos](https://developer.hashicorp.com/terraform/language/modules)
- [aws_s3_bucket resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
