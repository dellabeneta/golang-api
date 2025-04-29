
resource "digitalocean_droplet" "app" {
  for_each = local.droplets

  name     = each.key
  size     = var.droplet_app_size
  image    = var.droplet_image
  region   = var.droplet_region
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [digitalocean_ssh_key.ssh_key.fingerprint]
  ipv6     = false
}

