
# API Go com MongoDB e Infraestrutura DigitalOcean

Uma API REST pronta para produção construída com Go, usando MongoDB como banco de dados e implantada na infraestrutura da DigitalOcean utilizando Terraform e GitHub Actions.

## Visão Geral da Arquitetura

![Diagrama](./diagramas/2025-04-02-1618.excalidraw.png)

## Funcionalidades

### Endpoints da API
- `POST /api/pessoas` - Cria uma nova pessoa
- `GET /api/pessoas/{cpf}` - Busca pessoa pelo CPF

### Stack Técnica
- **Backend**: Go 1.24
  - Gorilla Mux para roteamento
  - Driver MongoDB para Go
  - Log estruturado
  - Middleware de tratamento de erros

- **Banco de Dados**: MongoDB 8.0
  - Armazenamento orientado a documentos
  - Configuração de alta disponibilidade
  - Persistência de dados

### Infraestrutura
- **Cloud Provider**: DigitalOcean
  - Load Balancer com terminação SSL
  - Rede VPC privada
  - Alta disponibilidade com múltiplos droplets
  - Configuração automatizada do MongoDB
  - Runner self-hosted do GitHub Actions

### Pipeline CI/CD
- Builds e deploys automatizados usando GitHub Actions
- Deploys sem downtime
- Gerenciamento de artefatos
- Suporte a múltiplos ambientes

## Estrutura do Projeto
```
├── compose.yaml
├── configs
│   └── db.go
├── controllers
│   └── personController.go
├── diagramas
│   ├── 2025-04-02-1618.excalidraw
│   └── 2025-04-02-1618.excalidraw.png
├── Dockerfile
├── go.mod
├── go.sum
├── main.go
├── models
│   └── person.go
├── nuke.sh
├── README.md
├── routes
│   └── router.go
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
```

## Primeiros Passos

### Pré-requisitos
- Go 1.24 ou superior
- Docker e Docker Compose
- Terraform 1.x
- Conta na DigitalOcean e token de API

### Desenvolvimento Local
1. Clone o repositório
```bash
git clone https://github.com/yourusername/golang-api.git
```

2. Inicie o ambiente de desenvolvimento
```bash
docker-compose up -d
```

3. Rode a aplicação
```bash
go run main.go
```

### Deploy da Infraestrutura
1. Configure as variáveis do Terraform
```bash
cp terraform.tfvars.example terraform.tfvars
# Edite o terraform.tfvars com seus valores
```

2. Inicialize e aplique o Terraform
```bash
cd terraform
terraform init
terraform apply
```

## Contribuindo
Por favor, leia o [CONTRIBUTING.md](CONTRIBUTING.md) para detalhes sobre nosso código de conduta e o processo de envio de pull requests.

## Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.