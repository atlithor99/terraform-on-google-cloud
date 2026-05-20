# Define a map variable
variable "zone_machine_map" {
  type = map(string)
  default = {
    "europe-north1-a" = "e2-micro"
    "europe-north1-b" = "e2-small"
    "europe-north1-c" = "e2-medium"
  }
}
# Resource Block: Create a single Compute Engine instance
resource "google_compute_instance" "myapp1" {
  # Meta-argument: for_each
  for_each     = var.zone_machine_map
  name         = "myapp1-vm-${each.key}-${each.value}"
  machine_type = each.value
  zone         = each.key
  tags         = [tolist(google_compute_firewall.fw_ssh.target_tags)[0], tolist(google_compute_firewall.fw_http.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  # Install Webserver
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

