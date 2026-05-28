# Locals Block
## 1. You should have a registered Domain
## 2. Your registered domain is configured in Cloud DNS for DNS management
## 3. Refer Section-15: Cloud Domains and Cloud DNS for complete understanding
locals {
  mydomain         = "myapp1.atletor.vcops.tech"
  dns_managed_zone = "atletor-vcops-tech"
}

# Resource: Cloud DNS Record Set for A Record
resource "google_dns_record_set" "a_record" {
  #project      = "kdaida123" only needed if dns zone is not present in the main gcp project
  managed_zone = local.dns_managed_zone
  name         = "${local.mydomain}."
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_address.mylb.address]
}
