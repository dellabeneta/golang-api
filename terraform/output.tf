
output "apps_droplet_ips" {
  value = {
    for name, droplet in digitalocean_droplet.app : name => droplet.ipv4_address_private
  }
}

output "apps_droplets_pips" {
  value = {
    for name, droplet in digitalocean_droplet.app : name => droplet.ipv4_address
  }
}

output "mongodb_droplet_ip" {
  value = digitalocean_droplet.mongodb.ipv4_address_private
}

output "mongodb_droplet_pip" {
  value = digitalocean_droplet.mongodb.ipv4_address
}

output "loadbalancer_pip" {
  value = digitalocean_loadbalancer.loadbalancer.ip 
}