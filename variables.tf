variable "gcs_bucket_name" {
  description = "The name of the GCS bucket to create."
  type        = string
  default     = "gcp-spark-storage-bucket"
}

variable "gcp_region" {
  description = "The GCP region to create the bucket in."
  type        = string
  default     = "us-east1"
}

variable "gcp_project_id" {
  description = "The GCP project ID to create the bucket in."
  type        = string
}
