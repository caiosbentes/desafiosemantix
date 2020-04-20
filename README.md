# Desafio proposto para a vaga de Analista DevOps da Semantix

Este repositório tem como objetivo documentar a resolução do teste técnico descrito abaixo

## Proposta

Criação total de um ambiente de esteira CI/CD, contendo os seguintes softwares:

* Jenkins;
* Nexus;
* SonnarQube;

Requisitos:

* 1 - O ambiente deverá ser criado em um instância em cloud, criado através de script Terraform;
  * 1.1 - Deverá ter script de subida e descida de ambiente em horário das 8:00 as 20:00.
* 2  - Essa instância deverá aceitar multi-cloud, ou seja, as três principais clouds (AWS, GCP e Azure) poderão subir a instância criada.
* 3  - A criação da esteira deverá ser criada via docker-compose, tendo:
  * 3.1 - Portas expostas para acessar ambiente
  * 3.2 - Volumes persistidos para manipular artefatos;
  * 3.3 - Containers caso haja algum problema, deverão subir outra vez.

## Pré-requisitos máquina local

Para rápida reprodução da solução apresentada utilizo o terraform em um contêiner docker.

A máquina que repoduzirá deverá ter dois componentes intalados:

* Docker Engine
* Docker Compose

Segue abaixo a instação em um Sistema Linux.

Instalação do Docker Engine:

```bash
apt-get install docker-engine -y
```

Instalação do Docker Compose:

```bash
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Aplicando permisão de execução ao binário do Docker Compose:
```bash
chmod +x /usr/local/bin/docker-compose
```
