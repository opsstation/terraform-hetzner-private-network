provider "hcloud" {
  token = "******" # Security risk
}

module "hcloud_network" {
  source      = "./../"
  enable      = true
  name        = "network"
  environment = "demo"
  ip_range    = "10.10.0.0/16"

  subnets = {
    net1 = {
      ip_range = "10.10.0.0/24"
      type     = "cloud"
    }

    net2 = {
      ip_range = "10.10.1.0/24"
      type     = "cloud"
    }
  }

  routes = {
    route1 = {
      destination = "0.0.0.0/0"
      gateway     = "10.10.0.2"
    }
  }
}
