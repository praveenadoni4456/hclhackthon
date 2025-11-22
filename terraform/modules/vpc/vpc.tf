resource "google_compute_network" "vpc" {
    name = var.vpcname
    auto_create_subnetworks = false
    description = "VPC"
    routing_mode = "GLOBAL"
}

resource "google_compute_subnetwork" "public_subnet" {
    name = "public-subnet"
    region = var.region[count.index]
    network = google_compute_network.vpc.id
    ip_cidr_range = var.public_cidr[count.index]
    depends_on = [ google_compute_network.vpc ]
}

resource "google_compute_subnetwork" "private_subnet" {
    name = "private-subnet"
    region = var.region[count.index]
    network = google_compute_network.vpc.id
    ip_cidr_range = var.private_cidr[count.index]
    private_ip_google_access = true
    depends_on = [ google_compute_network.vpc ]
  
}

resource "google_compute_router" "router" {
  name    = "router"
  region  = var.region[count.index]
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat_type" {
  name                                = "nat"
  router                              = google_compute_router.router.name
  region                              = google_compute_router.router.region
  source_subnetwork_ip_ranges_to_nat  = google_compute_subnetwork.private_subnet.id
  enable_dynamic_port_allocation      = false
  enable_endpoint_independent_mapping = false
  min_ports_per_vm                    = 32
  type                                = "PUBLIC"
  subnetwork {
    name                    = google_compute_subnetwork.private_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}