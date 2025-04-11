#!/bin/bash

# Instala os pacotes gnupg e curl sem prompts interativos
apt-get install -y gnupg curl

# Baixa a chave pública do MongoDB e a salva como um arquivo GPG
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

# Adiciona o repositório do MongoDB ao APT
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Atualiza a lista de pacotes
apt-get update

# Instala o MongoDB sem prompts interativos
apt-get install -y mongodb-org

# Faz um backup do arquivo de configuração do MongoDB
cp /etc/mongod.conf /etc/mongod.conf.bak

# Modifica o bindIp no arquivo de configuração para aceitar conexões de qualquer interface
sed -i '21s/^  bindIp: 127\.0\.0\.1$/  bindIp: 0.0.0.0/' /etc/mongod.conf

# Habilita o serviço do MongoDB para iniciar automaticamente no boot
systemctl enable mongod.service

# Inicia o serviço do MongoDB
systemctl start mongod.service