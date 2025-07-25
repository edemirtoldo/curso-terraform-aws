# 🔗 Compartilhando Outputs entre Equipes com Remote State no Terraform

Esta pasta demonstra como **compartilhar informações de infraestrutura** (outputs) entre diferentes times/projetos Terraform usando o recurso `terraform_remote_state` e o backend remoto S3.

## Estrutura

- **01-vpc/**: Cria uma VPC e uma Subnet, exportando seus outputs.
- **02-ec2/**: Consome os outputs da VPC/Subnet para criar uma instância EC2 na subnet criada pelo outro projeto.

## Fluxo de uso

1. **Acesse a pasta `01-vpc` e execute:**

   ```sh
   terraform init
   terraform apply -auto-approve
   ```

   Isso cria a VPC e a Subnet, salvando o estado e os outputs no S3.

2. **Acesse a pasta `02-ec2` e execute:**

   ```sh
   terraform init
   terraform apply -auto-approve
   ```

   O Terraform lê o output da subnet do estado remoto da VPC usando o bloco:

   ```hcl
   data "terraform_remote_state" "vpc" {
     backend = "s3"
     config = {
       bucket  = "tfstate-2025-703671905295"
       key     = "dev/05-outputs/networking/terraform.tfstate"
       region  = "us-east-1"
       profile = "tf_thinkpad_edemirtoldo"
     }
   }
   ```

   Assim, a instância EC2 é criada na subnet provisionada pelo outro time/projeto.

3. **Consulte os outputs:**

   - Em `01-vpc/outputs.tf`, veja os IDs e ARNs da VPC e Subnet.
   - Em `02-ec2/outputs.tf`, veja o ARN e o IP público da instância criada.

4. **Destrua a infraestrutura:**
   - Primeiro em `01-vpc`:
     ```sh
     terraform destroy -auto-approve
     ```
   - Depois em `02-ec2`:
     ```sh
     terraform destroy -auto-approve
     ```
     Isso garante que dependências sejam respeitadas e recursos não fiquem órfãos.

## Por que usar assim?

- **Separação de responsabilidades:** Times diferentes podem gerenciar partes distintas da infraestrutura.
- **Reutilização:** Outputs de um projeto podem ser consumidos por outros, sem duplicação de código.
- **Segurança e rastreabilidade:** O estado fica centralizado no S3, com locking via DynamoDB.

## Referências

- [terraform_remote_state data source](https://developer.hashicorp.com/terraform/language/state/remote-state-data)
- [Outputs no Terraform](https://developer.hashicorp.com/terraform/language/values/outputs)
