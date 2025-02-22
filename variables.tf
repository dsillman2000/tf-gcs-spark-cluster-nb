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

variable "gcp_dataproc_image_version" {
  description = "The Dataproc image version to use for the cluster."
  type        = string
  default     = "2.2-debian12"
}

variable "gcp_dataproc_worker_machine_type" {
  description = "The machine type to use for the Dataproc worker nodes."
  type        = string
  default     = "n1-standard-2"
}

variable "gcp_dataproc_master_machine_type" {
  description = "The machine type to use for the Dataproc master node."
  type        = string
  default     = "n1-standard-2"
}

variable "gcp_dataproc_worker_count" {
  description = "The number of worker nodes to create in the Dataproc cluster."
  type        = number
  default     = 2
}
