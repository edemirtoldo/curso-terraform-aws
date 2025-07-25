# ☁️ Usando Backend Remoto S3 no Terraform

Esta pasta demonstra como **utilizar o backend remoto S3** para armazenar o estado do Terraform de forma centralizada e segura, além de usar DynamoDB para locking.

## O que está implementado aqui?

- O backend do Terraform está configurado para armazenar o arquivo de estado (`terraform.tfstate`) em um bucket S3.
- O DynamoDB é usado para garantir o locking do estado, evitando conflitos em execuções simultâneas.
- Um exemplo de recurso AWS (EC2) é criado para demonstrar o uso do backend remoto.

## Principais arquivos

- [`versions.tf`](versions.tf): Define a versão do Terraform, do provider AWS e configura o backend S3/DynamoDB.
- [`main.tf`](main.tf): Configura o provider AWS e tags padrão.
- [`data.tf`](data.tf): Busca a AMI mais recente do Ubuntu.
- [`ec2.tf`](ec2.tf): Cria uma instância EC2 usando a AMI consultada.
- `.terraform/` e `.terraform.lock.hcl`: Gerenciados automaticamente pelo Terraform para controle de dependências e estado local/remoto.

## Como funciona

1. **Configuração do backend**:  
   O bloco `backend "s3"` em [`versions.tf`](versions.tf) define:

   - O bucket S3 onde o estado será salvo.
   - A tabela DynamoDB para locking.
   - O caminho (`key`) do arquivo de estado.
   - Região e perfil AWS.

2. **Execução**:  
   Ao rodar `terraform init`, o Terraform inicializa o backend remoto.  
   Ao rodar `terraform apply`, o estado é salvo no S3 e o locking é feito via DynamoDB.

3. **Recursos criados**:  
   Uma instância EC2 é criada usando a AMI mais recente do Ubuntu.

## Benefícios do backend remoto

- Permite colaboração entre times.
- Evita conflitos e corrupção do estado.
- Mantém o histórico do estado de forma segura.

## Como testar

1. Execute `terraform init` para inicializar o backend remoto.
2. Execute `terraform apply` para criar a infraestrutura e salvar o estado no S3.
3. Verifique o arquivo de estado no bucket S3 e o lock na tabela DynamoDB durante a execução.

## Referências

- [Backend S3 no Terraform](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
- [Locking com DynamoDB](https://developer.hashicorp.com/terraform/language/settings/backends/s3#dynamodb-table-locking)
