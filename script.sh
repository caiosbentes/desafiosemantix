#!/bin/bash
#
# script.sh
#
# Autor : Caio Bentes <caiosbentes@gmail.com>
#
#  ------------------------------------------------------------- 
# este script instala o python, docker e docker compose. 
# 

#Instalacao python e curl
apt install python curl -y

#Instalacao docker engine
curl -sSL https://get.docker.com/ | sh

#Instalacao docker compose
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Permissao de execucao ao binario do docker compose
chmod +x /usr/local/bin/docker-compose
