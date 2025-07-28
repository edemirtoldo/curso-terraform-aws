# 🖥️ Terraform CLI – Comandos Essenciais e Recursos

Esta pasta demonstra o uso dos principais comandos da CLI do Terraform, exemplos de variáveis, arquivos de configuração e dicas para automação.

---

## 📖 Introdução

Para explorar todos os comandos e opções do Terraform, utilize:

```bash
terraform -help
```

### 🚀 Comandos principais do Terraform CLI

```bash
terraform init
```

Inicializa o diretório de trabalho, baixa plugins e configura o backend remoto.

```bash
terraform validate
```

Valida a sintaxe e a configuração dos arquivos Terraform.

```bash
terraform plan
```

Mostra o que será criado, alterado ou destruído antes de aplicar as mudanças.

```bash
terraform apply
```

Aplica as mudanças na infraestrutura.

```bash
terraform destroy
```

Remove/destrói toda a infraestrutura gerenciada pelo Terraform.

### 🛠️ Outros comandos úteis

```bash
terraform output
```

Exibe os outputs definidos no código após o apply.

```bash
terraform show
```

Mostra o estado atual da infraestrutura.

```bash
terraform state
```

Gerencia o arquivo de estado manualmente.

```bash
terraform fmt
```

Formata os arquivos .tf para o padrão oficial.

```bahs
terraform providers
```

Lista os providers usados no projeto.

```bash
terraform console
```

Abre um console interativo para testar expressões e variáveis.

```bash
terraform taint / untaint
```

Marca recursos para recriação no próximo apply.

```bash
terraform import
```

Importa recursos existentes para o estado do Terraform.

```bash
terraform graph
```

Gera um grafo visual das dependências dos recursos.

### 🌎 Variáveis de ambiente e execução em outros diretórios

Você pode executar comandos em subdiretórios usando a opção -chdir:

```hcl
terraform -chdir=04-terraform-cli init
```

Para ver as opções de cada comando, use -help:

```hcl
terraform init -help
terraform validate -help
terraform plan -help
```

### 🐚 Dica: Tab-completion no shell

Ative o auto-complete para facilitar a digitação dos comandos:

```hcl
terraform -install-autocomplete
```

### 📂 Estrutura dos arquivos

- main.tf, ec2.tf, data.tf, variables.tf, outputs.tf: Exemplos de recursos, variáveis e outputs.
- dev.tfvars: Exemplo de arquivo de variáveis para ambientes.
- versions.tf: Versão do Terraform e providers.
- terraform-console/: Exemplo de uso do comando terraform console.

### 📚 Referências

- [Documentação oficial do Terraform CLI](https://developer.hashicorp.com/terraform/cli/commands)
