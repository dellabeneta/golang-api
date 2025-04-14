
### Backend (Go API)
- **Main Components**:
  - REST API using Gorilla Mux router
  - MongoDB integration
  - Person management endpoints (Create and Get by CPF)

### Infrastructure (Terraform)
- **DigitalOcean Resources**:
  - VPC network
  - Droplet (Ubuntu 24.04)
  - SSH key management
  - MongoDB installation
  - Application deployment setup

### CI/CD
- **GitHub Actions Pipeline**:
  - Builds Go application
  - Deploys to server
  - Handles artifacts

### Docker Setup
- Docker Compose configuration with:
  - Go application container
  - MongoDB container
  - Volume persistence

### Project Structure
```
golang-api/
├── configs/
│   └── db.go                 # MongoDB configuration
├── controllers/
│   └── personController.go   # API endpoints logic
├── models/
│   └── person.go            # Data models
├── routes/
│   └── router.go            # API routes
├── terraform/
│   ├── main.tf              # Main infrastructure
│   ├── provider.tf          # Provider configuration
│   ├── backend.tf           # S3 backend setup
│   ├── output.tf            # Infrastructure outputs
│   ├── mongo.sh            # MongoDB setup script
│   └── myapp.sh            # Application setup script
├── Dockerfile
├── compose.yaml
├── main.go                  # Application entry point
└── go.mod                   # Go dependencies
```

The API has two main endpoints:
1. `POST /api/pessoas` - Create a new person
2. `GET /api/pessoas/{cpf}` - Get person by CPF