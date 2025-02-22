output "gcp_dataproc_cluster_name" {
  description = "The name of the Dataproc cluster."
  value       = google_dataproc_cluster.dataproc_cluster.name
}

output "gcs_bucket_name" {
  description = "The name of the GCS bucket."
  value       = google_storage_bucket.gcs_bucket.name
}

output "gcp_dataproc_cluster_id" {
  description = "The ID of the Dataproc cluster."
  value       = google_dataproc_cluster.dataproc_cluster.id
}
