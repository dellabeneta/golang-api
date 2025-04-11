#!/bin/bash

apt-get install -y gnupg curl

curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-8.0.list

apt-get update

apt-get install -y mongodb-org

cp /etc/mongod.conf /etc/mongod.conf.bak

sed -i '21s/^  bindIp: 127\.0\.0\.1$/  bindIp: 0.0.0.0/' /etc/mongod.conf

systemctl enable mongod.service

systemctl start mongod.service