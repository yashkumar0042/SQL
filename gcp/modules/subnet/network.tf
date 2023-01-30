resource "google_compute_subnetwork" "public_subnet" {
  name          =  "${format("%s","${var.company}-${var.env}-${var.subnet_region}-pub-net")}"
  ip_cidr_range = "${var.var_public_subnet}"
  network       = "${var.network_self_link}"
  region        = "${var.subnet_region}"
}
resource "google_compute_subnetwork" "private_subnet" {
  name          =  "${format("%s","${var.company}-${var.env}-${var.subnet_region}-pri-net")}"
  ip_cidr_range = "${var.var_private_subnet}"
  network      = "${var.network_self_link}"
  region        = "${var.subnet_region}"
}
output "public_subnet_info" {
  value = {
    name = google_compute_subnetwork.public_subnet.name
    ip_cidr_range = google_compute_subnetwork.public_subnet.ip_cidr_range
  }
}

output "private_subnet_info" {
  value = {
    name = google_compute_subnetwork.private_subnet.name
    ip_cidr_range = google_compute_subnetwork.private_subnet.ip_cidr_range
  }
}