# 🛠️ Funções Built-in do Terraform

Esta pasta demonstra o uso das principais **funções nativas (built-in functions)** do Terraform, organizadas por categoria.

## Exemplos práticos

### Funções de String

- `replace`: Substitui partes de uma string.
- `lower`: Converte para minúsculas.
- `substr`: Extrai parte de uma string.
- `length`: Retorna o tamanho da string.
- `regex`: Aplica expressão regular.

### Funções de Coleção

- `contains`: Verifica se um elemento existe em uma lista.
- `element`: Retorna o elemento pelo índice.
- `index`: Retorna o índice de um elemento.
- `keys`: Retorna as chaves de um mapa.
- `lookup`: Busca valor por chave, com valor padrão.

### Funções de Codificação

- `jsonencode`: Codifica para JSON.
- `base64encode`: Codifica para Base64.
- `templatefile`: Renderiza um template usando variáveis.

### Funções de Tipo

- `can`: Verifica se uma expressão pode ser avaliada sem erro.
- `try`: Tenta avaliar uma expressão, retorna valor alternativo em caso de erro.

## Como funciona

- O arquivo [`main.tf`](main.tf) define vários exemplos usando funções nativas.
- O arquivo [`food.tftpl`](food.tftpl) é usado como template para demonstrar `templatefile`.
- O bloco `output "locals"` mostra os resultados das funções agrupados por categoria.

## Como testar

1. Execute `terraform apply` para ver os resultados das funções nos outputs.
2. Explore e altere os exemplos para entender o comportamento de cada função.

## Referências

- [Documentação oficial das funções do Terraform](https://developer.hashicorp.com/terraform/language/functions)
