
provider "google"{
      project =  var.project  #"gke-playground-275007"
      region  =  var.region   #asia-south1-a
      zone    =  var.zone     #asia-south1-a
}


# module "cloudsql" {
#     source = "./modules/cloudsql"
    
# }



resource "google_container_cluster" "primary" {
  name = "talentica-test"
  project = var.project
  location =  var.zone
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}

provider "kubernetes" {
  host = "https://${google_container_cluster.primary.endpoint}"
  username = "${google_container_cluster.primary.master_auth.0.username}"
  password = "${google_container_cluster.primary.master_auth.0.password}"
  client_certificate = "${base64decode(google_container_cluster.primary.master_auth.0.client_certificate)}"
  client_key = "${base64decode(google_container_cluster.primary.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)}"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "stage"
  }
}