# 🧮 Usando o Meta-Argumento `count` no Terraform

Esta pasta demonstra como utilizar o meta-argumento `count` para criar recursos de forma dinâmica e condicional.

## O que é o `count`?

- Permite criar múltiplas instâncias de um recurso usando um único bloco.
- Pode ser usado para criar recursos condicionalmente, dependendo de variáveis.

## Exemplo prático

Neste exemplo, usamos o recurso [`random_pet`](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) para gerar nomes aleatórios:

```hcl
variable "create_random_pets" {
  type    = bool
  default = true
}

resource "random_pet" "count" {
  count = var.create_random_pets ? 1 : 0
  length = 4
  prefix = count.index
}
```

- Se `create_random_pets` for `true`, será criado 1 recurso `random_pet`.
- Se for `false`, nenhum recurso será criado.

## Output

O output retorna o ID do(s) pet(s) criado(s):

```hcl
output "pets" {
  value = var.create_random_pets ? [
    random_pet.count[0].id,
    # random_pet.count[1].id,
    # ...
  ] : null
}
```

## Como testar

1. Altere o valor da variável `create_random_pets` para `false` ou `true`.
2. Execute `terraform apply` para ver o resultado.

## Referências

- [Documentação oficial do count](https://developer.hashicorp.com/terraform/language/meta-arguments/count)
- [random_pet resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)
