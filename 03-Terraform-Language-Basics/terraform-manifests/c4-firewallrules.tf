# Firewall Rule: SSH
resource "google_compute_firewall" "fw_ssh" {
  name    = "fwrule-allow-ssh22"
  network = google_compute_network.myvpc.id
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

# Firewall Rule: HTTP Port 80
resource "google_compute_firewall" "fw_http" {
  name    = "fwrule-allow-http80"
  network = google_compute_network.myvpc.id
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}
