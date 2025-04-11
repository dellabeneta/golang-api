# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = digitalocean_vpc.vpc_golang.id
}

output "vpc_ip_range" {
  description = "IP range of the VPC"
  value       = digitalocean_vpc.vpc_golang.ip_range
}

# Droplet Outputs
output "droplet_id" {
  description = "ID of the Droplet"
  value       = digitalocean_droplet.droplet_golang.id
}

output "droplet_ipv4_address" {
  description = "Public IPv4 address of the Droplet"
  value       = digitalocean_droplet.droplet_golang.ipv4_address
}

output "droplet_ipv4_private" {
  description = "Private IPv4 address of the Droplet"
  value       = digitalocean_droplet.droplet_golang.ipv4_address_private
}

output "droplet_size" {
  description = "Size of the Droplet"
  value       = digitalocean_droplet.droplet_golang.size
}

output "droplet_region" {
  description = "Region where the Droplet is deployed"
  value       = digitalocean_droplet.droplet_golang.region
}

output "ssh_fingerprint" {
  description = "Fingerprint of the SSH key"
  value       = digitalocean_ssh_key.ssh_key_golang.fingerprint
}