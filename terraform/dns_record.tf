
resource "digitalocean_record" "a_record" {
    domain = "dellabeneta.tech"
    type   = "A"
    name   = "api"
    value  = digitalocean_loadbalancer.loadbalancer.ip
}