## 📘 Quando usar `data` (Data Source) no Terraform?

O bloco `data` é usado no Terraform quando você **precisa obter informações de recursos que já existem**, ou seja, **não serão criados** pelo seu código Terraform, mas você precisa referenciá-los.

---

### ✅ Casos comuns de uso

1. **Recursos existentes fora do seu controle**

   - Buscar recursos criados manualmente ou por outro time/módulo.
   - **Exemplo:** Obter a AMI mais recente da Amazon Linux:

     ```hcl
     data "aws_ami" "amazon_linux" {
       most_recent = true
       owners      = ["amazon"]

       filter {
         name   = "name"
         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
       }
     }
     ```

2. **Compartilhamento entre módulos**

   - Um módulo pode usar `data` para acessar recursos definidos em outro.

3. **Consulta de informações dinâmicas**
   - Buscar dados como zonas de disponibilidade, IPs públicos, tags, etc.

---

### 🔁 Diferença entre `resource` e `data`

| Bloco Terraform | Finalidade                                   | Ações           | Exemplo                    |
| --------------- | -------------------------------------------- | --------------- | -------------------------- |
| `resource`      | Cria e gerencia um recurso novo              | Criar/modificar | `resource "aws_s3_bucket"` |
| `data`          | Lê um recurso já existente (somente leitura) | Consultar       | `data "aws_s3_bucket"`     |

---
