#!/bin/bash
#
# script.sh
#
# Autor : Caio Bentes <caiosbentes@gmail.com>
#
#  -------------------------------------------------------------
# este script instala o python, docker, docker compose e cria um ambiente
# de esteira CI/CD (contendo  JenkinsNexus e SonnarQube) via docker-compose
#

function install_docker_doccker_compose() {
  #Instalacao python e curl
  apt install python curl -y

   #Instalacao docker engine
  curl -sSL https://get.docker.com/ | sh

   #Instalacao docker compose
  curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

   #Permissao de execucao ao binario do docker compose
  chmod +x /usr/local/bin/docker-compose
}

function create_docker_compose() {
cat <<EOF > /opt/docker-compose.yml
version: "3"
networks:
  network: {}
volumes:
  nexus_data:
  jenkins_data:
  sonar_data:
  postgres_data:
  db-data:
services:
  nexus:
    networks:
    - network
    image: sonatype/nexus3
    restart: always
    ports:
    - 8081:8081
    volumes:
    - nexus_data:/var/lib/nexus
  sonarqube:
    networks:
    - network
    image: sonarqube:lts
    restart: always
    environment:
      SONARQUBE_JDBC_USERNAME: username
      SONARQUBE_JDBC_PASSWORD: 11235813
      SONARQUBE_JDBC_URL: jdbc:postgresql://database:5432/sonarqube
    ports:
    - 9000:9000
    volumes:
    - sonar_data:/var/lib/sonar
  database:
    networks:
    - network
    image: postgres:alpine
    restart: always
    environment:
      POSTGRES_DB: sonarqube
      POSTGRES_USER: username
      POSTGRES_PASSWORD: 11235813
    volumes:
    - postgres_data:/var/lib/postgresql
  jenkins:
    networks:
    - network
    image: jenkins/jenkins:lts
    restart: always
    ports:
    - 8080:8080
    - 50000:50000
    volumes:
    - jenkins_data:/var/jenkins_home
EOF
}

function change_kernel_params() {
  #numero maximo de arquivos abertos igual a 65536
  echo "fs.file-max=65536" | sudo tee -a /etc/sysctl.conf
  
  #numero maximo de areas de mapas de memoria que um processo pode ter alterado para 262144
  echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
  
  #Reload de configuracoes de parametros do kernel
  sysctl -p
}

function change_linux_limits() {
  #quantidade máxima de processos para um único usuário igual a 4096
  ulimit -u 4096

  # número máximo de descritores de arquivos que podem estar abertos ao mesmo tempo igual a 65536
  ulimit -n 65536
}

function up_containers() {
  #Executo a funcao que cria o docker-compose.yml
  create_docker_compose

  #Executo o docker-compose.yml
  cd /opt && docker-compose up -d
}

install_docker_doccker_compose
change_kernel_params
change_linux_limits
up_containers
