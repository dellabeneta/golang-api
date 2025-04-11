terraform {
    required_providers {
        digitalocean = {
            source  = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

provider "digitalocean" {
    token = var.do_token
}

variable "do_token" {
    description = "DigitalOcean API Token"
    type        = string
    sensitive   = true
}

variable "ssh_key_path" {
    description = "Path to SSH public key"
    type        = string
    default     = "~/.ssh/id_ed25519.pub"
}