
resource "digitalocean_firewall" "firewall_mongo" {
  name = "firewall-mongo"

  droplet_ids = [digitalocean_droplet.mongodb.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = ["10.0.20.0/24", "170.247.106.188/32"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    source_addresses = ["10.0.20.0/24", "170.247.106.188/32"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["10.0.20.0/24", "170.247.106.188/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0"]
  }

}