<div align = "center" >

#  Configuração de Infraestrutura na AWS com Terraform 

<img src= "https://user-images.githubusercontent.com/87483916/236377736-e4281d7b-8822-4203-99e9-9ad30863ad6c.jpg" />


Este repositório contém arquivos de configuração em Terraform para provisionar infraestrutura na AWS.

</div>

## Pré-requisitos

Antes de começar, você precisa ter os seguintes itens instalados e configurados em seu ambiente:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- Credenciais AWS válidas para o seu ambiente (chave de acesso e chave secreta).

## Como usar

1. Clone este repositório:

```
git clone https://github.com/seu-usuario/nome-do-repositorio.git
```

2. Acesse o diretório do repositório:

```
cd nome-do-repositorio
```

3. Configure as credenciais AWS em seu ambiente:

```
aws configure
```

4. Inicialize o diretório Terraform:

```
terraform init
```

5. Visualize as mudanças que serão feitas:

```
terraform plan
```

6. Provisione a infraestrutura:

```
terraform apply
```

7. Para destruir a infraestrutura provisionada:

```
terraform destroy
```

## Recursos

Os seguintes recursos serão provisionados com estes arquivos de configuração Terraform:

- VPC (10.123.0.0/16)
- Sub-rede pública (10.123.1.0/24)
- Internet Gateway
- Route Table
- Security Group
- Key Pair
- Instância EC2

## Design da arquitetura


## Comandos principais

- terraform init
- terraform plan
- terraform destroy
- terraform apply
- terraform state list
- terraform fmt
- terraform validate
- terraform state mv
- terraform state show
- terraform workspace list
- terraform workspace show 
- terraform workspace new [workspace]
- terraform workspace select [workspace]
-

## Flags 

plan, apply, destroy --auto-aprove
apply --replace
init --reconfigure
init --migrate-state
destroy -- force

## Cursos 

FREE COURSES: 

🔹 Learn Terraform and AWS - Full Course for Beginners

https://lnkd.in/gyfBDCqM

🔹 Terraform Foundations Course with AWS

https://lnkd.in/gPazrhA7

🔹 Terraform Course – Automate your AWS cloud infrastructure

https://lnkd.in/gKAJrg_k

🔹 Terraform Tutorial for Beginners + Hands-On Labs

https://lnkd.in/g9r38YGH
 
🔹 Complete Terraform Course - From Beginner to Pro 

https://lnkd.in/gRXQuqJU

FREE CERTIFICATION PREP:
 
🔹 HashiCorp Terraform Associate Prep Certification Course

https://lnkd.in/gB7Q6Yc7

https://developer.hashicorp.com/terraform/tutorials#get-certified




## Contribuições

Contribuições são sempre bem-vindas! Se você quiser contribuir com este projeto, por favor, envie um pull request com suas sugestões.



