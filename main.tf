## Managed By : OpsStation
## Description : This Script is used to create Transfer Server, Transfer User And label .
## Copyright @ OpsStation. All Right Reserved.
module "labels" {
  source      = "opsstation/labels/multicloud"
  version     = "1.0.0"
  name        = var.name
  environment = var.environment
  repository  = var.repository
  attributes  = var.attributes
}

####################################################################################
#Provides details about a specific Hetzner Cloud Location.
#Use this resource to get detailed information about a specific Location.
#####################################################################################
data "hcloud_location" "default" {
  name = var.location
}

####################################################################################
#Provides a Hetzner Cloud Network to represent a Network in the Hetzner Cloud.
#####################################################################################
resource "hcloud_network" "default" {
  count                    = var.enable ? 1 : 0
  name                     = module.labels.id
  ip_range                 = var.ip_range
  labels                   = module.labels.labels
  delete_protection        = var.delete_protection
  expose_routes_to_vswitch = var.expose_routes_to_vswitch
}

####################################################################################
#Provides a Hetzner Cloud Network Subnet to represent a Subnet in the Hetzner Cloud.
#####################################################################################
resource "hcloud_network_subnet" "default" {
  for_each     = var.enable ? var.subnets : {}
  network_id   = var.enable ? hcloud_network.default[0].id : null
  type         = each.value["type"]
  ip_range     = each.value["ip_range"]
  network_zone = data.hcloud_location.default.network_zone
}

####################################################################################
#Provides a Hetzner Cloud Network Route to represent a Network route in the Hetzner Cloud.
#####################################################################################
resource "hcloud_network_route" "default" {
  for_each    = var.enable ? var.routes : {}
  network_id  = var.enable ? hcloud_network.default[0].id : null
  destination = each.value["destination"]
  gateway     = each.value["gateway"]
}
