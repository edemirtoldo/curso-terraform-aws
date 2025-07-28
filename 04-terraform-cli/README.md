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

## 🔧 terraform init – Opções Gerais Explicadas

O comando terraform init é usado para inicializar um diretório Terraform. Isso inclui baixar os provedores, configurar o backend (se definido), e preparar o diretório para uso.

A seguir, as principais opções que você verá ao rodar terraform init -help, com explicações:

### ✅ Opções mais úteis no dia a dia

| Opção                    | Explicação                                                                                                           |                                                                                              |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| \`-backend=true          | false\`                                                                                                              | Habilita ou desabilita a configuração de backend. Default: `true`.                           |
| `-backend-config=PATH`   | Permite passar parâmetros de configuração para o backend (ex: bucket, key, region etc). Pode ser usado várias vezes. |                                                                                              |
| \`-get=true              | false\`                                                                                                              | Define se o Terraform deve baixar os módulos (default: `true`).                              |
| \`-get-plugins=true      | false\`                                                                                                              | ⚠️ Obsoleto – Plugins agora fazem parte dos provedores.                                      |
| \`-input=true            | false\`                                                                                                              | Interativo ou não – se `false`, não perguntará nada e usará valores padrão.                  |
| \`-lock=true             | false\`                                                                                                              | Ativa ou desativa o _state lock_ (travamento do estado durante alterações). Default: `true`. |
| `-lock-timeout=DURATION` | Tempo que o Terraform deve esperar pela liberação do lock (ex: `60s`, `2m`).                                         |                                                                                              |
| `-no-color`              | Remove cores da saída – útil para logs ou automações.                                                                |                                                                                              |
| `-plugin-dir=DIR`        | Diretório para plugins locais (casos avançados).                                                                     |                                                                                              |
| `-reconfigure`           | Reconfigura o backend, mesmo que já esteja inicializado. Muito usado se você mudou algo no `backend`.                |                                                                                              |
| `-upgrade`               | Atualiza os provedores e módulos para a última versão permitida.                                                     |                                                                                              |

### 📌 Exemplos práticos

1. Init com backend remoto e variáveis separadas:

```bash
terraform init \
  -backend=true \
  -backend-config="bucket=my-bucket" \
  -backend-config="key=dev/terraform.tfstate" \
  -backend-config="region=us-east-1"
```

2. Init forçando reconfiguração do backend:

```bash
terraform init -reconfigure
```

3. Init em modo não-interativo e sem cores (ex: CI/CD):

```bash
terraform init -input=false -no-color
```

## 📌 terraform plan -help — Planeja a execução

Opções úteis:

| Opção               | Explicação                                                                        |                                                    |
| ------------------- | --------------------------------------------------------------------------------- | -------------------------------------------------- |
| \`-input=true       | false\`                                                                           | Permite ou não entrada interativa. Em CI: `false`. |
| \`-lock=true        | false\`                                                                           | Usa travamento do estado.                          |
| `-lock-timeout=...` | Tempo de espera para o lock. Ex: `60s`.                                           |                                                    |
| `-out=ARQUIVO`      | Salva o plano em um arquivo `.tfplan` (útil para revisão ou aplicação posterior). |                                                    |
| \`-refresh=true     | false\`                                                                           | Atualiza os dados do estado com o provedor.        |
| `-target=RESOURCE`  | Planeja apenas um recurso específico. Ex: `aws_instance.web`.                     |                                                    |
| `-var="KEY=VALUE"`  | Passa variáveis direto no CLI.                                                    |                                                    |
| `-var-file=ARQUIVO` | Usa um arquivo de variáveis (ex: `dev.tfvars`).                                   |                                                    |

### Exemplo

```bash
terraform plan -out=plan.tfplan -var-file="dev.tfvars"
```

## 🚀 terraform apply -help — Executa as mudanças

## Opções úteis:

| Opção                | Explicação                                           |                                          |
| -------------------- | ---------------------------------------------------- | ---------------------------------------- |
| `-auto-approve`      | Pula a confirmação interativa (usado em automações). |                                          |
| \`-input=true        | false\`                                              | Entrada interativa. Em scripts: `false`. |
| \`-lock=true         | false\`                                              | Usa travamento do state.                 |
| `-lock-timeout=...`  | Tempo de espera para o lock.                         |                                          |
| \`-refresh=true      | false\`                                              | Atualiza dados antes de aplicar.         |
| `-target=RESOURCE`   | Aplica só um recurso.                                |                                          |
| `-var` / `-var-file` | Mesmo uso que no `plan`.                             |                                          |

### Exemplo:

```bash
terraform apply -auto-approve -var-file="dev.tfvars"
```

### Ou aplicando um plano já salvo:

```bash
terraform apply plan.tfplan
```

## 💣 terraform destroy -help — Destroi os recursos

### Opções úteis:

| Opção                | Explicação                             |                     |
| -------------------- | -------------------------------------- | ------------------- |
| `-auto-approve`      | Pula confirmação interativa.           |                     |
| \`-input=true        | false\`                                | Entrada interativa. |
| \`-lock=true         | false\`                                | Usa travamento.     |
| `-lock-timeout=...`  | Tempo de espera para lock.             |                     |
| `-target=RESOURCE`   | Destroi apenas o recurso especificado. |                     |
| `-var` / `-var-file` | Mesmo uso que nos anteriores.          |                     |

Exemplo:

```bash
terraform destroy -auto-approve -var-file="dev.tfvars"
```

### 📂 Estrutura dos arquivos

- main.tf, ec2.tf, data.tf, variables.tf, outputs.tf: Exemplos de recursos, variáveis e outputs.
- dev.tfvars: Exemplo de arquivo de variáveis para ambientes.
- versions.tf: Versão do Terraform e providers.
- terraform-console/: Exemplo de uso do comando terraform console.

### 📚 Referências

- [Documentação oficial do Terraform CLI](https://developer.hashicorp.com/terraform/cli/commands)
