# 📂 Configurando o Backend Remoto via Arquivo (`backend.hcl`)

Esta pasta demonstra como configurar o **backend remoto do Terraform** usando um arquivo externo (`backend.hcl`) para armazenar o estado em um bucket S3 e usar DynamoDB para locking.

## O que está implementado?

- O backend do Terraform é configurado via arquivo [`backend.hcl`](backend.hcl), facilitando a reutilização e a separação das configurações sensíveis.
- O estado do Terraform (`terraform.tfstate`) é salvo em um bucket S3.
- O DynamoDB é utilizado para garantir o locking do estado, evitando conflitos em execuções simultâneas.
- Um recurso de exemplo (`random_pet`) é criado apenas para demonstrar o funcionamento do backend remoto.

## Principais arquivos

- [`main.tf`](main.tf): Configura o provider AWS e um recurso de exemplo.
- [`versions.tf`](versions.tf): Define a versão do Terraform, do provider AWS e declara o uso do backend S3.
- [`backend.hcl`](backend.hcl): Contém as configurações do backend remoto (bucket, key, região, perfil e tabela DynamoDB).
- `.terraform/` e `.terraform.lock.hcl`: Gerenciados automaticamente pelo Terraform para controle de dependências e estado local/remoto.

## Como utilizar

1. **Inicialize o backend remoto**  
   Execute:

   ```sh
   terraform init -backend=true -backend-config="backend.hcl"
   ```

   Isso conecta o Terraform ao backend S3/DynamoDB usando as configurações do arquivo.

2. **Aplique a infraestrutura**  
   Execute:
   ```sh
   terraform apply -auto-approve
   ```
   O estado será salvo no bucket S3 e o locking será feito via DynamoDB.

## Benefícios

- Permite colaboração entre times, com estado centralizado e seguro.
- Facilita a reutilização das configurações do backend em diferentes ambientes.
- Evita conflitos e corrupção do estado com o uso de locking via DynamoDB.

## Exemplo de configuração do backend (`backend.hcl`)

```hcl
bucket         = "tfstate-2025-703671905295"
key            = "dev/03-backend-file/terraform.tfstate"
region         = "us-east-1"
profile        = "tf_thinkpad_edemirtoldo"
dynamodb_table = "tflock-tfstate-2025-703671905295"
```

## Referências

- [Backend S3 no Terraform](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
- [Configuração via arquivo externo](https://developer.hashicorp.com/terraform/language/settings/backends/configuration#partial-configuration)
