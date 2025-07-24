# 📦 Usando o Recurso `terraform_data` e Provisioners no Terraform

Esta pasta demonstra como utilizar o recurso especial [`terraform_data`](https://developer.hashicorp.com/terraform/language/resources/terraform-data) e provisioners para manipular dados e executar comandos locais durante o ciclo de vida dos recursos.

## Principais conceitos

### Recurso `terraform_data`

- Permite armazenar e manipular valores arbitrários (variáveis, locais, referências, etc).
- Pode ser usado para acionar recriação de recursos usando o atributo `triggers_replace`.
- Útil para controlar dependências e fluxos de atualização.

### Provisioners

- O provisioner `local-exec` executa comandos locais após a criação ou alteração de um recurso.
- Neste exemplo, o IP privado da instância EC2 é gravado no arquivo `private_ips.txt` toda vez que o recurso muda.

## Exemplos práticos

- [`main.tf`](main.tf): Define providers, recursos `terraform_data`, provisioners e um recurso `random_pet` para gerar nomes aleatórios.
- [`data.tf`](data.tf): Consulta informações da conta AWS e busca a AMI mais recente do Ubuntu.
- [`ec2.tf`](ec2.tf): Cria uma instância EC2 usando a AMI consultada e aplica o meta-argumento `replace_triggered_by` para forçar substituição quando o recurso `terraform_data.replacement` muda.
- [`private_ips.txt`](private_ips.txt): Arquivo que armazena os IPs privados das instâncias criadas.

## Como funciona

1. O recurso `terraform_data.provisioners` depende do IP privado da instância EC2.
2. Sempre que o IP muda, o comando `local-exec` grava o novo IP em `private_ips.txt`.
3. O recurso `terraform_data.replacement` pode ser alterado via variável `revision` para forçar a recriação da instância EC2.

## Como testar

1. Execute `terraform apply` para criar os recursos e gravar o IP no arquivo.
2. Altere a variável `revision` e aplique novamente para forçar a substituição da instância e atualizar o IP.
3. Confira o arquivo `private_ips.txt` para ver o histórico dos IPs criados.

## Referências

- [terraform_data resource](https://developer.hashicorp.com/terraform/language/resources/terraform-data)
- [Provisioners no Terraform](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)
