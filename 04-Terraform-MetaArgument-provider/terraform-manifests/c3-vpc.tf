# Resource: VPC
resource "google_compute_network" "myvpc" {
  project                 = "quality-jawfish-815045"
  name                    = "vpc1"
  auto_create_subnetworks = false
}

# Resource: Subnet
resource "google_compute_subnetwork" "mysubnet1" {
  provider      = google.europe-north1
  name          = "mysubnet1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.myvpc.id
}

# Resource: Subnet2
resource "google_compute_subnetwork" "mysubnet2" {
  provider      = google.europe-west1 # Define provider to use
  name          = "mysubnet2"
  ip_cidr_range = "10.132.0.0/20"
  network       = google_compute_network.myvpc.id
}

