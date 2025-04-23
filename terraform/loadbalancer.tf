
resource "digitalocean_loadbalancer" "loadbalancer" {
  name                   = "loadbalancer"
  region                 = "sfo2"
  vpc_uuid               = digitalocean_vpc.vpc.id
  size                   = "lb-small"
  redirect_http_to_https = true

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "http"
    target_port     = 8080
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port       = 443
    entry_protocol   = "https"
    target_port      = 8080
    target_protocol  = "http"
    certificate_name = "dellabeneta-tech"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [for droplet in digitalocean_droplet.app : droplet.id]
}