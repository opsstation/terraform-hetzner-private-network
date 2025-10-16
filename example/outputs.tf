output "network_name" {
  value       = module.hcloud_network.name
  description = "The name for the new Hetzner Cloud networks."
}

output "network_id" {
  value       = module.hcloud_network.id
  description = "The ID for the new Hetzner Cloud networks."
}

output "network_ip_range" {
  value       = module.hcloud_network.ip_range
  description = "The ip range for the new Hetzner Cloud networks."
}