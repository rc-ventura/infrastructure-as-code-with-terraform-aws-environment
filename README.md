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


![terraform-aws-environment](https://github.com/rc-ventura/infrastructure-as-code-with-terraform-aws-environment/assets/87483916/decba148-bfbe-4612-a490-51328270bacc)

## Notas

#### Any resources can be created with command import in CLI. First you would must to create on aws GUI that resources.
#### in second moment create the same resources in terraform. After that in Cli execute the command:
 
 ```
 $ terraform import aws_s3_bucket.mybucket  bucket=name  

```
#### to move any resources without to destroy.  Edit one resources without destroy it.
#### edit the resources and execute: 

```
 $ terraform state mv aws_s3_bucket.mybucket  aws_s3_bucket.new-mybucket 

```


#### If you need to reuse some resource in a project, you can remove a resources and paste the same in another project. You can too to move any resources one directory to the other. Execute that command:

```
 $ terraform state mv -state-out=" [path de destino]" aws_s3_bucket.new-my-bucket aws_s3_bucket.mybucket 

```
* In the origin dir execute the command above.
* Declare the destiny dir.
* Declare the name bucket and name resource current.
* Declare the name bucker and name resource older.


<<<<<<< HEAD
<<<<<<< Updated upstream
### When I create a terraform.tfvars I set my env variables replaces the variables.tf file For example, if I uncomment the line so var.host_os = "linux" and not "windows" declared in variables.tf
=======
=======
>>>>>>> main
#### When I create a terraform.tfvars I set my env variables replaces the variables.tf file For example, if I uncomment the line so var.host_os = "linux" and not "windows" declared in variables.tf

#### Interable input variables --> When I define a variables without default this terraform ask me what is my var.host_os? Linux or windows? 

#### When you need create any resources in the cloud providers, you create each resources one by one. You can use "COUNT" as parameter for create many resources at once.

<<<<<<< HEAD
```
count = 2
bucket = "mybucket-s3-terraform-state-bucket-${count.index}"
```
=======
>>>>>>> main

#### Any resources can be created with command import in CLI. First you would must to create on aws GUI that resources.in second moment create the same resources in terraform. After that in Cli execute the command:

```
# $ terraform import aws_s3_bucket.mybucket  bucket=name  
```
<<<<<<< HEAD

=======
>>>>>>> main
#### to move any resources without to destroy.  Edit one resources without destroy it. Edit the resources and execute 

#### If you need to create many resources with differences char for example name of a bucket, you could use the "FOR EACH" 

```
main.tf --> resource "aws_s3_bucket" "mybucket" {
                for_each = toset(var.bucket_name)
                bucket = each.key
                tags = {
                    environment = "dev"
             }
        }

```
terraform.tfvars -->  bucker_name = ["ed-my-bucket", "my-ed-bucket"]

```

```
variables.tf --> variables "bucker_name" {
                        type = list
}
    ```
<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> main


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



