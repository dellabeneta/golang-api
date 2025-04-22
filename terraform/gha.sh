#!/bin/bash

# Verifica se o usuário ubuntu já existe, cria se não existir
if ! id "ubuntu" &>/dev/null; then
  useradd -m -s /bin/bash ubuntu
  echo "ubuntu:ubuntu" | chpasswd
  usermod -aG sudo ubuntu
  echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi