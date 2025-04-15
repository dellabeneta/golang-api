
resource "digitalocean_droplet" "mongodb" {
  name     = "mongodb"
  size     = var.droplet_mongo_size
  image    = var.droplet_image
  region   = var.droplet_region
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [digitalocean_ssh_key.ssh_key.fingerprint]

  provisioner "file" {
    source      = "mongo.sh"
    destination = "/tmp/mongo.sh"
    connection {
      host        = self.ipv4_address
      type        = local.ssh_connection.type
      user        = local.ssh_connection.user
      private_key = local.ssh_connection.private_key
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/mongo.sh",
      "bash /tmp/mongo.sh"
    ]
    connection {
      host        = self.ipv4_address
      type        = local.ssh_connection.type
      user        = local.ssh_connection.user
      private_key = local.ssh_connection.private_key
    }
  }
}