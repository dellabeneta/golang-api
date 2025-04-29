
resource "digitalocean_firewall" "firewall_gha" {
  name = "firewall-gha"

  droplet_ids = [digitalocean_droplet.gha.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = ["10.0.20.0/24", "170.247.104.202/32"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    source_addresses = ["10.0.20.0/24", "170.247.104.202/32"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["10.0.20.0/24", "170.247.104.202/32"]
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