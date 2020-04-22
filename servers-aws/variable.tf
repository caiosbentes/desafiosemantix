variable "region" {
  description = "Define em qual região a instância será implantada"
  default = "us-east-1"
}

variable "name" {
  description = "Nome da aplicação"
  default = "server01"
}

variable "env" {
  description = "Ambiente da aplicação"
  default = "prod"
}

variable "ami" {
  description = "AWS AMI que será utilizada "
  default = "ami-07ebfd5b3428b6f4d"
}

variable "instance_type" {
  description = "AWS Instance type define a configuração de hardware da máquina"
  default = "t2.micro"
}

variable "servers" {
  description = "Quantidade de instâncias que serão criadas"
  default = 1
}
