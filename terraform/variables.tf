
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

variable "droplet_app_size" {
  default = "s-1vcpu-512mb-10gb"
}

variable "droplet_mongo_size" {
  default = "s-1vcpu-1gb"
}

variable "droplet_gha_size" {
  default = "s-2vcpu-2gb"
}

variable "droplet_image" {
  default = "ubuntu-24-04-x64"
}

variable "droplet_region" {
  default = "sfo2"
}