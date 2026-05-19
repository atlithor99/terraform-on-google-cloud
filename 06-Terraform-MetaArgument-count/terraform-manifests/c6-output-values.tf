# Terraform Output Values
output "vm_name_0" {
  description = "VM Machine Type"
  value       = google_compute_instance.myapp1[0].name
}

output "vm_name_1" {
  description = "VM Machine Type"
  value       = google_compute_instance.myapp1[1].name
}

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

# output - For Loop with Map Advanced
output "for_output_map2" {
  description = "For loop with map - advanced"
  value       = { for c, instance in google_compute_instance.myapp1 : c => instance.instance_id }
}

# output - For Loop with Map Advanced
output "for_output_map3" {
  description = "For loop with map - advanced"
  value       = { for c, instance in google_compute_instance.myapp1 : instance.name => instance.instance_id }
}

# Output Legacy Splat Operator (latest) - Returns list
output "legacy_splat_instance" {
  description = "Legacy Splat Operator"
  value       = google_compute_instance.myapp1.*.name
}

# Output Latest Generalized Splat Operator - Returns the list
output "latest_splat_operator" {
  description = "Generalized latest Splat Operator"
  value       = google_compute_instance.myapp1[*].name
}

/* Single VM instance outputs
## ATTRIBUTES
output "vm_instanceid" {
  description = "VM Instance ID"
  value       = google_compute_instance.myapp1.instance_id
}

output "vm_selflink" {
  description = "VM Instance Self link"
  value       = google_compute_instance.myapp1.self_link
}

output "vm_id" {
  description = "VM ID"
  value       = google_compute_instance.myapp1.id
}

output "vm_external_ip" {
  description = "VM External IPs"
  value       = google_compute_instance.myapp1.network_interface[0].access_config[0].nat_ip
}

## ARGUMENTS
output "vm_name" {
  description = "VM Name"
  value       = google_compute_instance.myapp1.name
}

output "vm_machine_type" {
  description = "VM Machine Type"
  value       = google_compute_instance.myapp1.machine_type
}
*/
