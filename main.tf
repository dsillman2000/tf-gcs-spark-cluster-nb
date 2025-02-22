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
      machine_type  = var.gcp_dataproc_master_machine_type
    }

    worker_config {
      num_instances = var.gcp_dataproc_worker_count
      machine_type  = var.gcp_dataproc_worker_machine_type
    }

    endpoint_config {
      enable_http_port_access = true
    }

    software_config {
      image_version       = var.gcp_dataproc_image_version
      optional_components = ["JUPYTER"]
    }
  }
}
