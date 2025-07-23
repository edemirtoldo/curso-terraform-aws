# DevOps Unleashed: Domine a AWS com o Terraform para automação de infraestrutura no mundo real

## Links

- Discord: https://discord.gg/CvZ28vfuMt​
- Área de membros: https://hotmart.com/pt-br/club/cleber-gasparoto/products/3563550

Descubra o poder do Terraform e leve suas habilidades de automação para o próximo nível! Este curso abrangente levará você desde os fundamentos até implementações avançadas, capacitando-o a criar aplicações modernas na AWS de maneira eficiente e confiável.

O que você vai aprender:
- Automatizar a criação e manutenção da infraestrutura na AWS.
- Dominar conceitos básicos e avançados, incluindo módulos, terraform CLI, terraform test e arquivos de estado do Terraform.
- Criar um site estático com React.js utilizando AWS S3, CloudFront, certificado SSL e domínio personalizado.
- Desenvolver uma aplicação serverless utilizando AWS Lambda, DynamoDB, API Gateway, Cognito, SQS, SNS e Cloudwatch.
- Implementar uma aplicação auto-escalável com VPC, Internet Gateway, Subnets, Security Groups, EC2, Load Balancer e Auto Scaling Group.

Pré-requisitos:
- Noções básicas de programação.

Para quem é este curso:
- Desenvolvedores, DevOps ou qualquer pessoa interessada em aprender Terraform e automatizar processos de infraestrutura.

Requisitos de Inscrição:
- É necessário possuir uma conta na AWS (pode ser criada gratuitamente, exigindo apenas um cartão de crédito internacional).

Por que escolher este curso:
- Aprenda com exemplos práticos e casos reais.
- Ganhe acesso a códigos prontos para uso em sua própria infraestrutura na AWS.
- Desenvolva habilidades prontas para produção com as melhores práticas do mercado.

Pronto para transformar sua abordagem à infraestrutura? Inscreva-se agora e comece sua jornada com o Terraform!

## Curriculum

### Boas vindas
- Mensagem de boas vindas
- Links para Discord e Github

### Introdução ao Terraform
- O que é Terraform?
- Como o Terraform funciona?
- Por que utilizar o Terraform?
- Terraform vs Alternativas

### Setup do ambiente de desenvolvimento
- Instalando o Terraform
- Instalando o TFEnv (gerenciador de versões do Terraform)
- Configurando VSCode (editor de texto)
- Configurando AWS CLI

### Fluxo básico de trabalho do Terraform
- Criando um bucket manualmente
- O que são Providers?
- Providers na prática
- O que são Resources?
- Criando um bucket com Terraform
- Entendendo a documentação dos resources
- Alterando o bucket com Terraform
- Gerenciamento do do state (estado) do Terraform
- O arquivo tfstate
- Destruindo o bucket com Terraform

### Linguagem de Configuração do Terraform
- Introdução
- Linguagem de Configuração na prática
- O que são variáveis
- Variáveis obrigatórias e opcionais
- Tipos de variáveis
- Tipos complexos de variáveis
- Argumentos das variáveis
- Variáveis com tfvars
- O que são Locals?
- Locals na prática
- O que são Outputs?
- Outputs na prática
- Interpolation
- Data sources
- Import block
- Meta-argument: count
- Meta-argument: for_each
- Meta-argument: depends_on
- Meta-argument: provider
- Meta-argument: lifecycle
- Built-in functions (funções do Terraform)
- O novo recurso terraform_data
- Expressões for e splat

### Remote state
- Introdução
- Criando o bucket e a tabela para serem usados como remote state
- Usando o remote state
- Configuração do Backend
- Configuração do Backend através do CLI
- Outputs do remote state

### Terraform CLI
- Introdução
- Environment variables (variáveis de ambiente)
- terraform init
- terraform plan, apply e destroy
- terraform console
- terraform fmt e validate
- terraform output
- terraform show
- terraform state
- terraform state na prática

### Modules
- Usando módulos
- Usando módulos da comunidade
- Como criar módulos?
- Codificando nosso primeiro módulo
- Outputs dentro dos módulos
- Conhecendo os dynamic blocks (blocos dinâmicos)
- Criando sub-module dentro do nosso módulo
- Testando nosso módulo
- Publicando nosso módulo

### Terraform test
- Introdução
- Sintaxe
- Setup
- Testando a validação das variáveis
- Testando o recurso do DynamoDB
- Testando o recurso do S3
- Testando o website

### Hospedando um website estático com S3, Cloudfront e Route53
- Introdução
- Instalando React.js
- S3 bucket
- Cloudfront distribution
- Route53 records
- ACM certificate
- Atualizando conteúdo do site
- Destruindo a infraestrutura

### Criando uma aplicação Serverless
- Introdução
- Cognito UI
- Cognito código do Terraform
- DynamoDB
- Código Typescript das Lambdas
- Artefato das Lambdas
- Module IAM
- Module Lambda
- Lambdas
- API Gateway
- Outputs
- Teste de integração
- SNS
- SQS
- Teste de integração do micro-serviço
- Route53
- Destruindo a infraestrutura


### Criando uma aplicação auto-escalável
- Introdução
- VPC
- Launch template
- Load balancer
- Autoscaling group
- Teste de integração
- RDS, EC2 e terraform destroy

### Integração entre Frontend (react.js) e Backend (aplicação serverless)
- Introdução
- S3 e Cloudfront
- Configuração do CORS dentro da API Gateway
- Configuração dos logs dentro da API Gateway
- Teste de integração entre o Frontend e o Backend
- Destruindo a infraestrutura
