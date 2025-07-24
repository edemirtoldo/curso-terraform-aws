# 🗂️ Usando o Meta-Argumento `for_each` no Terraform

Esta pasta demonstra como utilizar o meta-argumento `for_each` para criar múltiplos recursos de forma dinâmica e personalizada.

## O que é o `for_each`?

- Permite criar várias instâncias de um recurso usando um mapa ou conjunto como referência.
- Cada instância recebe uma chave (`each.key`) e um valor (`each.value`) do mapa.

## Exemplo prático

Neste exemplo, usamos o recurso [`random_pet`](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) para gerar nomes aleatórios para diferentes animais:

```hcl
variable "create_random_pets" {
  type    = bool
  default = true
}

resource "random_pet" "for_each" {
  for_each = var.create_random_pets ? {
    dog  = 4
    cat  = 2
    bird = 3
    pig  = 5
  } : {}

  length = each.value
  prefix = each.key
}
```

- Se `create_random_pets` for `true`, será criado um `random_pet` para cada animal do mapa, com o comprimento definido pelo valor.
- Se for `false`, nenhum recurso será criado.

## Output

O output retorna o ID de cada pet criado:

```hcl
output "pets" {
  value = var.create_random_pets ? [
    random_pet.for_each["dog"].id,
    random_pet.for_each["cat"].id,
    random_pet.for_each["bird"].id,
    random_pet.for_each["pig"].id,
  ] : null
}
```

## Como testar

1. Altere o valor da variável `create_random_pets` para `false` ou `true`.
2. Execute `terraform apply` para ver o resultado.

## Referências

- [Documentação oficial do for_each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
- [random_pet resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)
