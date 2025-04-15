locals {
  droplets = {
    "app-1" = {},
    "app-2" = {}
  }

  ssh_connection = {
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/id_ed25519")
  }
}