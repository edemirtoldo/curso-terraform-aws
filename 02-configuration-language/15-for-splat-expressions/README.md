# 🔁 Expressões `for` e `Splat` no Terraform

Esta pasta demonstra como usar **expressões for** e **splat expressions** para manipular listas, mapas e atributos de recursos de forma dinâmica e eficiente.

## Principais conceitos

### Expressão `for`

Permite criar novas listas ou mapas a partir de outros, aplicando transformações ou filtros:

```hcl
[for ip in local.ips : ip.private]
{ for server, attr in aws_instance.example : server => attr.tags.Name }
```

### Splat Expression (`*`)

Permite acessar rapidamente um atributo de todos os itens de uma lista de recursos:

```hcl
local.ips[*].public
```

## Exemplos práticos

- **EC2 por for_each**: Cria duas instâncias EC2 usando um mapa, cada uma com tipo e nome diferentes.
- **Locals**: Usa `for` para extrair extensões de arquivos e transformar para maiúsculo.
- **Outputs**:
  - `instace_arns`: Lista os ARNs das instâncias EC2.
  - `instance_name`: Mapa com os nomes das instâncias.
  - `extensions` e `extensions_upper`: Lista e mapa de extensões de arquivos.
  - `private_ips` e `public_ips`: Lista de IPs privados e públicos usando `for` e splat.

## Como testar

1. Execute `terraform apply` para criar os recursos e ver os outputs.
2. Altere os mapas ou listas em `locals.tf` para ver como as expressões se adaptam.

## Referências

- [for Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)
- [Splat expressions](https://developer.hashicorp.com/terraform/language/expressions/splat)
