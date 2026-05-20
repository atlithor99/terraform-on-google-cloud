# Terraform Output Values

# output - For Loop with List
output "for_output_list" {
  description = "For loop with list"
  value       = [for instance in google_compute_instance.myapp1 : instance.name]
}

# output - For Loop with Map
output "for_output_map1" {
  description = "For loop with map"
  value       = { for instance in google_compute_instance.myapp1 : instance.name => instance.instance_id }
}

# Output Latest Generalized Splat Operator - Returns the list
output "vm_external_ips" {
  description = "VM Instance Names -> VM External IPs"
  value       = { for instance in google_compute_instance.myapp1 : instance.name => instance.network_interface[0].access_config[0].nat_ip }
}
