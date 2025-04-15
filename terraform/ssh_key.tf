# Create SSH key
resource "digitalocean_ssh_key" "ssh_key" {
  name       = "ssh-key"
  public_key = file(var.ssh_key_path)
}