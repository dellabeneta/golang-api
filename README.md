### Visão Geral

Este projeto é uma API RESTful escrita em Go para cadastro e consulta de pessoas, utilizando MongoDB como banco de dados. O deploy é automatizado com Docker, Terraform, Ansible e GitHub Actions, visando provisionamento de infraestrutura na DigitalOcean e entrega contínua.

---

### Estrutura do Projeto

```
├── main.go                # Ponto de entrada da aplicação Go
├── configs/               # Configuração de conexão com MongoDB
├── controllers/           # Lógica dos endpoints da API
├── models/                # Definição dos modelos de dados
├── routes/                # Definição das rotas HTTP
├── Dockerfile             # Build da aplicação em container
├── compose.yaml           # Orquestração local com Docker Compose
├── terraform/             # Infraestrutura como código (DigitalOcean)
├── ansible/               # Playbooks para configuração de servidores
├── .github/workflows/     # Pipeline CI/CD com GitHub Actions
```


### Funcionalidades

- **Cadastro de Pessoa:**  
  `POST /api/pessoas`  
  Cria um novo cadastro de pessoa (nome, sobrenome, email, CPF).

- **Consulta por CPF:**  
  `GET /api/pessoas/{cpf}`  
  Busca uma pessoa cadastrada pelo CPF.


### Stack Tecnológica

- **Backend:** Go 1.24, [mux](https://github.com/gorilla/mux)
- **Banco de Dados:** MongoDB 8
- **Infraestrutura:** DigitalOcean (Droplets, VPC, Load Balancer, DNS, Firewalls)
- **Provisionamento:** Terraform, Ansible
- **CI/CD:** GitHub Actions (build, deploy automatizado)
- **Containerização:** Docker, Docker Compose


### Como Executar Localmente

1. **Pré-requisitos:**  
   - Docker e Docker Compose instalados

2. **Subir a stack local:**  
   ```sh
   docker compose up --build
   ```
   A API estará disponível em `http://localhost:8080`.


### Deploy em Produção

1. **Provisionamento da Infraestrutura:**  
   - Configure variáveis no Terraform (variables.tf)
   - Execute:
     ```sh
     cd terraform
     terraform init
     terraform apply
     ```
   - Os IPs e domínios serão exportados em tf_outputs.json.

2. **Configuração dos Servidores:**  
   - Gere o inventário:
     ```sh
     cd ansible
     ./script.sh
     ```
   - Execute os playbooks:
     ```sh
     ansible-playbook -i inventory.ini playbook_mongo.yml
     ansible-playbook -i inventory.ini playbook_myapp.yml
     ```

3. **Deploy da Aplicação:**  
   - O deploy é feito automaticamente via GitHub Actions para os servidores provisionados.


### Endpoints

- `POST /api/pessoas`  
  Corpo:
  ```json
  {
    "nome": "João",
    "sobrenome": "Silva",
    "email": "joao@email.com",
    "cpf": "12345678900"
  }
  ```

- `GET /api/pessoas/{cpf}`  
  Resposta:
  ```json
  {
    "id": "...",
    "nome": "João",
    "sobrenome": "Silva",
    "email": "joao@email.com",
    "cpf": "12345678900"
  }
  ```


### Infraestrutura

- **Terraform:**  
  Provisiona VPC, Droplets (app, MongoDB, GHA runner), Load Balancer, DNS, Firewalls na DigitalOcean.

- **Ansible:**  
  Instala MongoDB, configura serviço systemd para a aplicação Go.

- **GitHub Actions:**  
  Builda o binário, faz upload como artefato e realiza deploy remoto via SSH nos servidores.


### Diagrama

O diagrama de arquitetura está disponível em 2025-04-02-1618.excalidraw.


### Observações

- O endereço do MongoDB está configurado em db.go como `mongodb://10.0.20.4:27017`.
- O deploy espera variáveis de ambiente e secrets configurados no GitHub para acesso SSH e caminhos de deploy.
- O domínio público da API é configurado via DNS na DigitalOcean como `api.dellabeneta.tech`.