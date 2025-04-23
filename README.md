
### Backend (API em Go)
- **Componentes Principais**:
  - API REST usando o roteador Gorilla Mux
  - Integração com MongoDB
  - Endpoints para gerenciamento de Pessoas (Criar e Buscar por CPF)

### Infraestrutura (Terraform)
- **Recursos DigitalOcean**:
  - Balanceador de Carga
  - Rede VPC
  - Droplets (Ubuntu 24.04)
  - Um Droplet para Self-runner
  - Instalação do MongoDB
  - Configuração de implantação da aplicação

### CI/CD
- **Pipeline GitHub Actions**:
  - Compila a aplicação Go
  - Implanta no servidor
  - Gerencia artefatos

<!-- ### Configuração Docker
- Configuração do Docker Compose com:
  - Container da aplicação Go
  - Container MongoDB
  - Persistência de volume -->

  ### Diagrama da Arquitetura
  ![Diagrama da Arquitetura](./diagramas/2025-04-02-1618.excalidraw.png)

### Estrutura do Projeto
```
├── compose.yaml
├── configs
│   └── db.go
├── controllers
│   └── personController.go
├── diagramas
│   ├── 2025-04-02-1618.excalidraw
│   └── 2025-04-02-1618.excalidraw.png
├── Dockerfile
├── go.mod
├── go.sum
├── main.go
├── models
│   └── person.go
├── nuke.sh
├── README.md
├── routes
│   └── router.go
└── terraform
    ├── backend.tf
    ├── dns_record.tf
    ├── droplet_app.tf
    ├── droplet_gha.tf
    ├── droplet_mongo.tf
    ├── firewall_app.tf
    ├── firewall_gha.tf
    ├── firewall_mongo.tf
    ├── gha.sh
    ├── loadbalancer.tf
    ├── locals.tf
    ├── mongo.sh
    ├── myapp.sh
    ├── network.tf
    ├── outputs.tf
    ├── provider.tf
    ├── ssh_key.tf
    ├── terraform.tfvars
    └── variables.tf

7 directories, 32 files
```

A API possui dois endpoints principais:
1. `POST /api/pessoas` - Criar uma nova pessoa
2. `GET /api/pessoas/{cpf}` - Buscar pessoa por CPF
