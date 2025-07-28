# 🧪 Testes Automatizados com Terraform Test

Esta pasta demonstra como usar o **framework nativo de testes do Terraform** (`terraform test`) para validar infraestrutura como código, incluindo testes unitários e de integração.

---

## 📦 O que está implementado?

- **Infraestrutura de exemplo:**
  - Bucket S3 público configurado como site estático (com arquivos `index.html` e `error.html`).
  - Tabela DynamoDB provisionada.
- **Testes automatizados:**
  - Testes unitários para validação de variáveis e entradas inválidas.
  - Testes de integração para garantir que recursos foram criados corretamente e estão funcionando.

---

## 🗂️ Estrutura dos arquivos

```
.
├── main.tf                # Provider e configurações globais
├── s3.tf                  # Recursos S3 (bucket, ACL, política, objetos)
├── dynamodb.tf            # Recurso DynamoDB
├── variables.tf           # Variáveis e validações
├── outputs.tf             # Outputs (ex: endpoint do site)
├── versions.tf            # Versão do Terraform, providers e backend remoto
├── www/                   # Arquivos do site (index.html, error.html)
└── tests/
    ├── infra.tftest.hcl   # Arquivo principal de testes
    ├── setup/             # Módulo para gerar nomes/capacidades aleatórios
    │   └── main.tf
    └── http/              # Módulo para testar HTTP do site
        └── main.tf
```

---

## 🚀 Como funcionam os testes

- **Unitários:**  
  O bloco `run "validate_inputs"` em [`tests/infra.tftest.hcl`](tests/infra.tftest.hcl) testa entradas inválidas para variáveis (nome do bucket, tabela, capacidades, etc), esperando falha de validação.

- **Setup dinâmico:**  
  O bloco `run "setup"` usa um módulo para gerar nomes e capacidades aleatórios, garantindo que os testes não colidam com recursos existentes.

- **Integração:**
  - `run "create_tables"`: Valida se a tabela DynamoDB foi criada com os parâmetros esperados.
  - `run "create_buckets"`: Valida se o bucket S3 foi criado corretamente e se os arquivos HTML foram enviados com o eTag correto.
  - `run "website_is_running"`: Usa o módulo HTTP para checar se o endpoint do site retorna HTTP 200.

---

## 🧑‍💻 Como rodar os testes

1. **Configure suas credenciais AWS** (perfil, variáveis de ambiente, etc).
2. Execute:
   ```sh
   terraform test
   ```
   O Terraform irá rodar todos os testes definidos em `tests/infra.tftest.hcl`.

---

## 💡 Observações

- Os testes criam e destroem recursos reais na AWS — monitore para evitar custos desnecessários.
- O uso de módulos de setup e http permite testes dinâmicos e validação de endpoints externos.
- As validações de variáveis estão em [`variables.tf`](variables.tf) e são testadas automaticamente.
- Os arquivos HTML de exemplo estão em [`www/`](www/).

## 📚 Referências

- [Terraform Test Framework](https://developer.hashicorp.com/terraform/language/tests)
- [Testando infraestrutura com Terraform](https://developer.hashicorp.com/terraform/tutorials/configuration-language/test)
