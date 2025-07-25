# 🖥️ Configurando o Backend Remoto via Linha de Comando (`-backend-config`)

Esta pasta demonstra como configurar o **backend remoto do Terraform** para armazenar o estado em um bucket S3 e usar DynamoDB para locking, passando as configurações diretamente pela linha de comando com `-backend-config`.

## O que está implementado?

- O backend do Terraform é configurado para usar S3 (estado remoto) e DynamoDB (locking) **sem precisar de arquivo de configuração dedicado**.
- Os parâmetros do backend são passados via múltiplas flags `-backend-config` no comando `terraform init`.
- Um recurso de exemplo (`random_pet`) é criado apenas para demonstrar o funcionamento do backend remoto.

## Principais arquivos

- [`main.tf`](main.tf): Configura o provider AWS e um recurso de exemplo.
- [`versions.tf`](versions.tf): Define a versão do Terraform, do provider AWS e declara o uso do backend S3 (sem parâmetros fixos).

## Como utilizar

1. **Inicialize o backend remoto**  
   Execute:

   ```sh
   terraform init -backend=true \
     -backend-config="bucket=tfstate-2025-703671905295" \
     -backend-config="key=dev/04-backend-cli/terraform.tfstate" \
     -backend-config="region=us-east-1" \
     -backend-config="profile=tf_thinkpad_edemirtoldo" \
     -backend-config="dynamodb_table=tflock-tfstate-2025-703671905295"
   ```

   Isso conecta o Terraform ao backend S3/DynamoDB usando os parâmetros fornecidos na linha de comando.

2. **Aplique a infraestrutura**  
   Execute:
   ```sh
   terraform apply -auto-approve
   ```
   O estado será salvo no bucket S3 e o locking será feito via DynamoDB.

## Benefícios

- Permite reutilizar o mesmo código para diferentes ambientes, mudando apenas os parâmetros do backend.
- Facilita automação e integração contínua, pois as configurações podem ser passadas por variáveis ou scripts.
- Mantém o código limpo, sem necessidade de arquivos de backend separados para cada ambiente.

## Referências

- [Backend S3 no Terraform](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
- [Configuração via linha de comando](https://developer.hashicorp.com/terraform/language/settings/backends/configuration#command-line-key-value-pairs)
