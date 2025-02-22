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
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create the bucket in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP region to create the bucket in. | `string` | `"us-east1"` | no |
| <a name="input_gcs_bucket_name"></a> [gcs\_bucket\_name](#input\_gcs\_bucket\_name) | The name of the GCS bucket to create. | `string` | `"gcp-spark-storage-bucket"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->