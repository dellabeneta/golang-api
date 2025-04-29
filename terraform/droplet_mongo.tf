
resource "digitalocean_droplet" "mongodb" {
  name     = "mongodb"
  size     = var.droplet_mongo_size
  image    = var.droplet_image
  region   = var.droplet_region
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [digitalocean_ssh_key.ssh_key.fingerprint]
}

