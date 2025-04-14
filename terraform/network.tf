
resource "digitalocean_vpc" "vpc" {
  name     = "vpc-app"
  region   = "sfo2"
  ip_range = "10.0.20.0/24"
}

