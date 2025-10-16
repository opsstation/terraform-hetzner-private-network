output "id" {
  value       = var.enable ? hcloud_network.default[0].id : null
  description = "The unique ID for the new Hetzner Cloud network."
}

output "name" {
  value       = var.enable ? hcloud_network.default[0].name : null
  description = "The name for the new Hetzner Cloud networks."
}

output "ip_range" {
  value       = var.enable ? hcloud_network.default[0].ip_range : null
  description = "The IP range for the new Hetzner Cloud network."
}

output "labels" {
  value       = var.enable ? hcloud_network.default[0].labels : null
  description = "The labels attached to the new Hetzner Cloud network."
}

output "delete_protection" {
  value       = var.enable ? hcloud_network.default[0].delete_protection : null
  description = "Whether or not deletion protection is enabled for the Hetzner Cloud network."
}

output "expose_routes_to_vswitch" {
  value       = var.enable ? hcloud_network.default[0].expose_routes_to_vswitch : null
  description = "Whether or not the Hetzner Cloud network is set to expose network routes to a Hetzner Robot vSwitch."
}

output "subnet_ids" {
  value = {
    for k, v in hcloud_network_subnet.default : k => v.id
  }
  description = "The unique ID for the subnet attached to the new Hetzner Cloud network."
}

output "subnet_types" {
  value = {
    for k, v in hcloud_network_subnet.default : k => v.type
  }
  description = "The type of subnets attached to the new Hetzner Cloud network."
}

output "subnet_ip_ranges" {
  value = {
    for k, v in hcloud_network_subnet.default : k => v.ip_range
  }
  description = "The IP ranges of the subnets attached to the new Hetzner Cloud network."
}

output "subnet_vswitch_ids" {
  value = {
    for k, v in hcloud_network_subnet.default : k => v.vswitch_id
  }
  description = "The vSwitch IDs of the subnets attached to the new Hetzner Cloud network."
}

output "route_ids" {
  value = {
    for k, v in hcloud_network_route.default : k => v.id
  }
  description = "The unique IDs for the network routes within the new Hetzner Cloud network."
}

output "route_destinations" {
  value = {
    for k, v in hcloud_network_route.default : k => v.destination
  }
  description = "The destinations for the network routes within the new Hetzner Cloud network."
}

output "route_gateways" {
  value = {
    for k, v in hcloud_network_route.default : k => v.gateway
  }
  description = "The gateways for the network routes within the new Hetzner Cloud network."
}
