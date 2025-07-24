## 📤 Outputs no Terraform

**Outputs** servem para **expor valores importantes** dos recursos criados pelo Terraform, para que você possa:

- Ver resultados após o `apply`
- Passar valores para outros módulos
- Usar em scripts externos ou CI/CD

### Como definir um output

```hcl
output "nome_do_output" {
  value = recurso.atributo
  description = "Descrição opcional do output"
  sensitive = true  # (opcional) oculta o valor em logs
}
```

### Exemplo

```hcl
output "bucket_name" {
  value       = aws_s3_bucket.meu_bucket.bucket
  description = "Nome do bucket S3 criado"
}
```

### Uso comum

- Expor IDs, nomes, IPs, URLs

- Facilitar integração entre módulos

- Ajudar no debug e visualização após deploy
