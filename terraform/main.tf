# Create VPC network
resource "digitalocean_vpc" "vpc_golang" {
    name     = "vpc-golang"
    region   = "sfo2"
    ip_range = "10.20.20.0/24"
}

# Create SSH key
resource "digitalocean_ssh_key" "ssh_key_golang" {
  name       = "ssh-key-golang"
  public_key = file(var.ssh_key_path)
}

# Create Droplet
resource "digitalocean_droplet" "droplet_golang" {
    name     = "droplet-golang"
    size     = "s-2vcpu-2gb"
    image    = "ubuntu-24-04-x64"
    region   = "sfo2"
    vpc_uuid = digitalocean_vpc.vpc_golang.id
    ssh_keys = [digitalocean_ssh_key.ssh_key_golang.fingerprint]

    provisioner "file" {
      source      = "scripts/" 
      destination = "/tmp/scripts/"
      connection {
        type        = "ssh"
        user        = "root"
        private_key = file("~/.ssh/id_ed25519")
        host        = self.ipv4_address
      }
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/scripts/mongo.sh",
        "/tmp/scripts/mongo.sh",
        "chmod +x /tmp/scripts/myapp.sh",
        "/tmp/scripts/myapp.sh"
      ]
      connection {
        type        = "ssh"
        user        = "root"
        private_key = file("~/.ssh/id_ed25519")
        host        = self.ipv4_address
      }
    }

}
