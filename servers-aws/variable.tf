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
  default = "ami-08bc77a2c7eb2b1da"
}

variable "instance_type" {
  description = "AWS Instance type define a configuração de hardware da máquina"
  default = "t2.micro"
}

variable "servers" {
  description = "Quantidade de instâncias que serão criadas"
  default = 1
}

variable "ami_key_pair_name" {
  description = "Par de chaves para acesso ssh"
  default = "recovery-key"
}

