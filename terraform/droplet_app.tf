
resource "digitalocean_droplet" "app" {
  for_each = local.droplets

  name     = each.key
  size     = var.droplet_app_size
  image    = var.droplet_image
  region   = var.droplet_region
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [digitalocean_ssh_key.ssh_key.fingerprint]
  ipv6     = false

  provisioner "file" {
    source      = "myapp.sh"
    destination = "/tmp/myapp.sh"
    connection {
      host        = self.ipv4_address
      type        = local.ssh_connection.type
      user        = local.ssh_connection.user
      private_key = local.ssh_connection.private_key
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/myapp.sh",
      "bash /tmp/myapp.sh"
    ]
    connection {
      host        = self.ipv4_address
      type        = local.ssh_connection.type
      user        = local.ssh_connection.user
      private_key = local.ssh_connection.private_key
    }
  }
}