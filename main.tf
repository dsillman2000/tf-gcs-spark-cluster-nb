resource "google_storage_bucket" "gcs_bucket" {
  name          = var.gcs_bucket_name
  location      = var.gcp_region
  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_dataproc_cluster" "dataproc_cluster" {
  name   = "spark-jupyter-cluster"
  region = var.gcp_region

  cluster_config {
    temp_bucket    = google_storage_bucket.gcs_bucket.name
    staging_bucket = google_storage_bucket.gcs_bucket.name

    master_config {
      num_instances = 1
      machine_type  = "n1-standard-1"
    }

    worker_config {
      num_instances = 2
      machine_type  = "n1-standard-1"
    }

    endpoint_config {
      enable_http_port_access = true
    }

    software_config {
      image_version       = "1.4"
      optional_components = ["ANACONDA", "JUPYTER"]
    }
  }
}
