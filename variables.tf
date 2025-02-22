variable "gcs_bucket_name" {
  description = "The name of the GCS bucket to create to use for the underlying Dataproc Hadoop storage."
  type        = string
  default     = "gcp-spark-storage-bucket"
}

variable "gcp_region" {
  description = "The GCP region to create the bucket and Dataproc cluster in."
  type        = string
  default     = "us-east1"
}

variable "gcp_project_id" {
  description = "The GCP project ID to create the bucket and Dataproc cluster in. Must already be created."
  type        = string
}
