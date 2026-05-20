# Terraform Datasources
data "google_compute_zones" "available" {
  status = "UP"
}

# Output value
output "compute_zones" {
  value       = data.google_compute_zones.available.names
  description = "List compute zones"
}
