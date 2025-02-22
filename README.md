# google-spark-cluster-notebook

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.10, <2.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=6.21, <7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_dataproc_cluster.dataproc_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_cluster) | resource |
| [google_storage_bucket.gcs_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_dataproc_image_version"></a> [gcp\_dataproc\_image\_version](#input\_gcp\_dataproc\_image\_version) | The Dataproc image version to use for the cluster. | `string` | `"2.2-debian12"` | no |
| <a name="input_gcp_dataproc_master_machine_type"></a> [gcp\_dataproc\_master\_machine\_type](#input\_gcp\_dataproc\_master\_machine\_type) | The machine type to use for the Dataproc master node. | `string` | `"n1-standard-2"` | no |
| <a name="input_gcp_dataproc_worker_count"></a> [gcp\_dataproc\_worker\_count](#input\_gcp\_dataproc\_worker\_count) | The number of worker nodes to create in the Dataproc cluster. | `number` | `2` | no |
| <a name="input_gcp_dataproc_worker_machine_type"></a> [gcp\_dataproc\_worker\_machine\_type](#input\_gcp\_dataproc\_worker\_machine\_type) | The machine type to use for the Dataproc worker nodes. | `string` | `"n1-standard-2"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create the bucket and Dataproc cluster in. Must already be created. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP region to create the bucket and Dataproc cluster in. | `string` | `"us-east1"` | no |
| <a name="input_gcs_bucket_name"></a> [gcs\_bucket\_name](#input\_gcs\_bucket\_name) | The name of the GCS bucket to create to use for the underlying Dataproc Hadoop storage. | `string` | `"gcp-spark-storage-bucket"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp_dataproc_cluster_id"></a> [gcp\_dataproc\_cluster\_id](#output\_gcp\_dataproc\_cluster\_id) | The ID of the Dataproc cluster. |
| <a name="output_gcp_dataproc_cluster_name"></a> [gcp\_dataproc\_cluster\_name](#output\_gcp\_dataproc\_cluster\_name) | The name of the Dataproc cluster. |
| <a name="output_gcs_bucket_name"></a> [gcs\_bucket\_name](#output\_gcs\_bucket\_name) | The name of the GCS bucket. |
<!-- END_TF_DOCS -->