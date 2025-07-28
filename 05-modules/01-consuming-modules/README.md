# 📦 Consumo de Módulos no Terraform

Esta pasta demonstra como **consumir módulos locais e remotos** no Terraform para criar recursos reutilizáveis, organizados e fáceis de manter.

---

## 📚 O que são módulos no Terraform?

Módulos são conjuntos de recursos Terraform agrupados em uma estrutura reutilizável. Eles permitem:

- Reutilização de código.
- Organização e padronização da infraestrutura.
- Compartilhamento de boas práticas entre projetos.

---

## 🗂️ Estrutura desta pasta

```
.
├── main.tf
├── outputs.tf
├── s3.tf
├── versions.tf
└── modules/
    └── s3/
        └── main.tf
```

---

## 🚀 Exemplos práticos deste diretório

### 1. Módulo local customizado

No arquivo [`s3.tf`](s3.tf), há exemplos (comentados) de como consumir um módulo local:

```hcl
module "s3_logs" {
  source = "./modules/s3"
  bucket_name = "module-${random_pet.this.id}-logs-bucket"
}
```

O módulo está em [`modules/s3/main.tf`](modules/s3/main.tf) e cria um bucket S3 com o nome informado.

### 2. Módulo remoto da comunidade

Também há exemplo (comentado) de uso de um módulo remoto do Terraform Registry:

```hcl
module "s3_pictures" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"
}
```

Esse módulo traz recursos prontos e parametrizáveis da comunidade.

### 3. Consumo de módulo de outro diretório

O exemplo ativo utiliza um módulo localizado em `../02-creating-modules`:

```hcl
module "s3_reports" {
  source = "../02-creating-modules"
  name = "module-${random_pet.this.id}-reports-bucket"
}
```

---

## 🏷️ Outputs

O arquivo [`outputs.tf`](outputs.tf) mostra como expor informações dos módulos utilizados, como ARN, nome e endpoints dos buckets criados.

Exemplo:

```hcl
output "reports_bucket" {
  value = {
    arn                  = module.s3_reports.arn
    name                 = module.s3_reports.name
    regional_domain_name = module.s3_reports.regional_domain_name
    website_endpoint     = module.s3_reports.website
  }
}
```

Outputs comentados mostram como expor informações dos outros módulos, caso sejam ativados.

---

## 💡 Observações

- Para ativar outros módulos, basta descomentar os blocos desejados em [`s3.tf`](s3.tf) e os outputs correspondentes.
- O uso de `random_pet` garante nomes únicos para os buckets.
- O backend remoto S3/DynamoDB está configurado em [`versions.tf`](versions.tf) para controle de estado.

---

## 📚 Referências

- [Documentação oficial de módulos](https://developer.hashicorp.com/terraform/language/modules)
- [Terraform Registry – Módulos públicos](https://registry.terraform.io/browse/modules)
