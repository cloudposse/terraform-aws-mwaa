
<!-- markdownlint-disable -->
# terraform-aws-mwaa [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-mwaa.svg)](https://github.com/cloudposse/terraform-aws-mwaa/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com) [![Discourse Forum](https://img.shields.io/discourse/https/ask.sweetops.com/posts.svg)](https://ask.sweetops.com/)
<!-- markdownlint-restore -->

[![README Header][readme_header_img]][readme_header_link]

[![Cloud Posse][logo]](https://cpco.io/homepage)

<!--




  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **





-->

Terraform module to provision Amazon Managed Workflows for Apache Airflow

---

This project is part of our comprehensive ["SweetOps"](https://cpco.io/sweetops) approach towards DevOps.
[<img align="right" title="Share via Email" src="https://docs.cloudposse.com/images/ionicons/ios-email-outline-2.0.1-16x16-999999.svg"/>][share_email]
[<img align="right" title="Share on Google+" src="https://docs.cloudposse.com/images/ionicons/social-googleplus-outline-2.0.1-16x16-999999.svg" />][share_googleplus]
[<img align="right" title="Share on Facebook" src="https://docs.cloudposse.com/images/ionicons/social-facebook-outline-2.0.1-16x16-999999.svg" />][share_facebook]
[<img align="right" title="Share on Reddit" src="https://docs.cloudposse.com/images/ionicons/social-reddit-outline-2.0.1-16x16-999999.svg" />][share_reddit]
[<img align="right" title="Share on LinkedIn" src="https://docs.cloudposse.com/images/ionicons/social-linkedin-outline-2.0.1-16x16-999999.svg" />][share_linkedin]
[<img align="right" title="Share on Twitter" src="https://docs.cloudposse.com/images/ionicons/social-twitter-outline-2.0.1-16x16-999999.svg" />][share_twitter]


[![Terraform Open Source Modules](https://docs.cloudposse.com/images/terraform-open-source-modules.svg)][terraform_modules]



It's 100% Open Source and licensed under the [APACHE2](LICENSE).







We literally have [*hundreds of terraform modules*][terraform_modules] that are Open Source and well-maintained. Check them out!






## Security & Compliance [<img src="https://cloudposse.com/wp-content/uploads/2020/11/bridgecrew.svg" width="250" align="right" />](https://bridgecrew.io/)

Security scanning is graciously provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS KUBERNETES](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=CIS+KUBERNETES+V1.5) | Center for Internet Security, KUBERNETES Compliance |
| [![CIS AWS](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS Compliance |
| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![CIS GCP](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-mwaa/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-mwaa&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |



## Usage


**IMPORTANT:** We do not pin modules to versions in our examples because of the
difficulty of keeping the versions in the documentation in sync with the latest released versions.
We highly recommend that in your code you pin the version to the exact version you are
using so that your infrastructure remains stable, and update versions in a
systematic way so that they do not catch you by surprise.

Also, because of a bug in the Terraform registry ([hashicorp/terraform#21417](https://github.com/hashicorp/terraform/issues/21417)),
the registry shows many of our inputs as required when in fact they are optional.
The table below correctly indicates which inputs are required.


For a complete example, see [examples/complete](examples/complete).

For automated tests of the complete example using [bats](https://github.com/bats-core/bats-core) and [Terratest](https://github.com/gruntwork-io/terratest)
(which tests and deploys the example on AWS), see [test](test).

```hcl
module "mwaa" {
  source = "cloudposse/mwaa/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"
  vpc_id                      = var.vpc_id
  subnet_ids                  = var.subnet_ids
  airflow_version             = "2.0.2"
  dag_s3_path                 = "dags"
  environment_class           = "mw1.small"
  min_workers                 = 1
  max_workers                 = 10
  webserver_access_mode       = "PRIVATE_ONLY"
  dag_processing_logs_enabled = true
  dag_processing_logs_level   = "INFO"
  name                        = "app"
  stage                       = "test"
  namespace                   = "eg"
  enabled                     = true
}
```




## Examples

Here is an example of using this module:
- [`examples/complete`](https://github.com/cloudposse/terraform-aws-mwaa/) - complete example of using this module



<!-- markdownlint-disable -->
## Makefile Targets
```text
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
<!-- markdownlint-restore -->
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_label"></a> [iam\_label](#module\_iam\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_mwaa_iam_role"></a> [mwaa\_iam\_role](#module\_mwaa\_iam\_role) | cloudposse/iam-role/aws | 0.15.0 |
| <a name="module_mwaa_s3_bucket"></a> [mwaa\_s3\_bucket](#module\_mwaa\_s3\_bucket) | cloudposse/s3-bucket/aws | 0.44.1 |
| <a name="module_mwaa_security_group"></a> [mwaa\_security\_group](#module\_mwaa\_security\_group) | cloudposse/security-group/aws | 0.4.2 |
| <a name="module_s3_label"></a> [s3\_label](#module\_s3\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_sg_label"></a> [sg\_label](#module\_sg\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_mwaa_environment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mwaa_environment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_security_group_rules"></a> [additional\_security\_group\_rules](#input\_additional\_security\_group\_rules) | A list of Security Group rule objects to add to the created security group, in addition to the ones<br>this module normally creates. (To suppress the module's rules, set `create_security_group` to false<br>and supply your own security group via `associated_security_group_ids`.)<br>The keys and values of the objects are fully compatible with the `aws_security_group_rule` resource, except<br>for `security_group_id` which will be ignored, and the optional "key" which, if provided, must be unique and known at "plan" time.<br>To get more info see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule . | `list(any)` | `[]` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_airflow_configuration_options"></a> [airflow\_configuration\_options](#input\_airflow\_configuration\_options) | The Airflow override options | `any` | `null` | no |
| <a name="input_airflow_version"></a> [airflow\_version](#input\_airflow\_version) | Airflow version of the MWAA environment, will be set by default to the latest version that MWAA supports. | `string` | `""` | no |
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to connect to the MWAA Environment | `list(string)` | `[]` | no |
| <a name="input_allowed_security_group_ids"></a> [allowed\_security\_group\_ids](#input\_allowed\_security\_group\_ids) | A list of IDs of Security Groups to allow access to the security group created by this module.<br>The length of this list must be known at "plan" time. | `list(string)` | `[]` | no |
| <a name="input_associated_security_group_ids"></a> [associated\_security\_group\_ids](#input\_associated\_security\_group\_ids) | A list of IDs of Security Groups to associate the created resource with, in addition to the created security group.<br>These security groups will not be modified and, if `create_security_group` is `false`, must have rules providing the desired access. | `list(string)` | `[]` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Enabling or disabling the creatation of a default IAM Role for AWS MWAA | `bool` | `true` | no |
| <a name="input_create_s3_bucket"></a> [create\_s3\_bucket](#input\_create\_s3\_bucket) | Enabling or disabling the creatation of an S3 bucket for AWS MWAA | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Enabling or disabling the creation of a default Security Group for AWS MWAA | `bool` | `true` | no |
| <a name="input_dag_processing_logs_enabled"></a> [dag\_processing\_logs\_enabled](#input\_dag\_processing\_logs\_enabled) | Enabling or disabling the collection of logs for processing DAGs | `bool` | `false` | no |
| <a name="input_dag_processing_logs_level"></a> [dag\_processing\_logs\_level](#input\_dag\_processing\_logs\_level) | DAG processing logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG | `string` | `"INFO"` | no |
| <a name="input_dag_s3_path"></a> [dag\_s3\_path](#input\_dag\_s3\_path) | The relative path to the DAG folder on your Amazon S3 storage bucket. | `string` | `"dags"` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_environment_class"></a> [environment\_class](#input\_environment\_class) | Environment class for the cluster. Possible options are mw1.small, mw1.medium, mw1.large. | `string` | `"mw1.small"` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | If `create_iam_role` is `false` then set this to the target MWAA execution role | `string` | `""` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The Amazon Resource Name (ARN) of your KMS key that you want to use for encryption. Will be set to the ARN of the managed KMS key aws/airflow by default. | `string` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_max_workers"></a> [max\_workers](#input\_max\_workers) | The maximum number of workers that can be automatically scaled up. Value need to be between 1 and 25. | `number` | `10` | no |
| <a name="input_min_workers"></a> [min\_workers](#input\_min\_workers) | The minimum number of workers that you want to run in your environment. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_plugins_s3_object_version"></a> [plugins\_s3\_object\_version](#input\_plugins\_s3\_object\_version) | The plugins.zip file version you want to use. | `string` | `null` | no |
| <a name="input_plugins_s3_path"></a> [plugins\_s3\_path](#input\_plugins\_s3\_path) | The relative path to the plugins.zip file on your Amazon S3 storage bucket. For example, plugins.zip. If a relative path is provided in the request, then plugins\_s3\_object\_version is required | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_requirements_s3_object_version"></a> [requirements\_s3\_object\_version](#input\_requirements\_s3\_object\_version) | The requirements.txt file version you | `string` | `null` | no |
| <a name="input_requirements_s3_path"></a> [requirements\_s3\_path](#input\_requirements\_s3\_path) | The relative path to the requirements.txt file on your Amazon S3 storage bucket. For example, requirements.txt. If a relative path is provided in the request, then requirements\_s3\_object\_version is required | `string` | `null` | no |
| <a name="input_scheduler_logs_enabled"></a> [scheduler\_logs\_enabled](#input\_scheduler\_logs\_enabled) | Enabling or disabling the collection of logs for the schedulers | `bool` | `false` | no |
| <a name="input_scheduler_logs_level"></a> [scheduler\_logs\_level](#input\_scheduler\_logs\_level) | Schedulers logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG | `string` | `"INFO"` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The Security Group description. | `string` | `"Security Group for AWS MWAA"` | no |
| <a name="input_source_bucket_arn"></a> [source\_bucket\_arn](#input\_source\_bucket\_arn) | If `create_s3_bucket` is `false` then set this to the Amazon Resource Name (ARN) of your Amazon S3 storage bucket. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The private subnet IDs in which the environment should be created. MWAA requires two subnets | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_task_logs_enabled"></a> [task\_logs\_enabled](#input\_task\_logs\_enabled) | Enabling or disabling the collection of logs for DAG tasks | `bool` | `false` | no |
| <a name="input_task_logs_level"></a> [task\_logs\_level](#input\_task\_logs\_level) | DAG tasks logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG | `string` | `"INFO"` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for the MWAA environment. Required if `create_security_group` is `true` | `string` | n/a | yes |
| <a name="input_webserver_access_mode"></a> [webserver\_access\_mode](#input\_webserver\_access\_mode) | Specifies whether the webserver should be accessible over the internet or via your specified VPC. Possible options: PRIVATE\_ONLY (default) and PUBLIC\_ONLY. | `string` | `"PRIVATE_ONLY"` | no |
| <a name="input_webserver_logs_enabled"></a> [webserver\_logs\_enabled](#input\_webserver\_logs\_enabled) | Enabling or disabling the collection of logs for the webservers | `bool` | `false` | no |
| <a name="input_webserver_logs_level"></a> [webserver\_logs\_level](#input\_webserver\_logs\_level) | Webserver logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG | `string` | `"INFO"` | no |
| <a name="input_weekly_maintenance_window_start"></a> [weekly\_maintenance\_window\_start](#input\_weekly\_maintenance\_window\_start) | Specifies the start date for the weekly maintenance window. | `string` | `null` | no |
| <a name="input_worker_logs_enabled"></a> [worker\_logs\_enabled](#input\_worker\_logs\_enabled) | Enabling or disabling the collection of logs for the workers | `bool` | `false` | no |
| <a name="input_worker_logs_level"></a> [worker\_logs\_level](#input\_worker\_logs\_level) | Workers logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG | `string` | `"INFO"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Amazon MWAA Environment |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The Created At date of the Amazon MWAA Environment |
| <a name="output_execution_role_arn"></a> [execution\_role\_arn](#output\_execution\_role\_arn) | IAM Role ARN for Amazon MWAA Execution Role |
| <a name="output_logging_configuration"></a> [logging\_configuration](#output\_logging\_configuration) | The Logging Configuration of the Amazon MWAA Environment |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | ARN of the S3 bucket |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | IDs of the MWAA Security Group(s) |
| <a name="output_service_role_arn"></a> [service\_role\_arn](#output\_service\_role\_arn) | The Service Role ARN of the Amazon MWAA Environment |
| <a name="output_status"></a> [status](#output\_status) | The status of the Amazon MWAA Environment |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider for the Amazon MWAA Environment |
| <a name="output_webserver_url"></a> [webserver\_url](#output\_webserver\_url) | The webserver URL of the Amazon MWAA Environment |
<!-- markdownlint-restore -->



## Share the Love

Like this project? Please give it a ★ on [our GitHub](https://github.com/cloudposse/terraform-aws-mwaa)! (it helps us **a lot**)

Are you using this project or any of our other projects? Consider [leaving a testimonial][testimonial]. =)



## Related Projects

Check out these related projects.

- [terraform-null-label](https://github.com/cloudposse/terraform-null-label) - Terraform module designed to generate consistent names and tags for resources. Use terraform-null-label to implement a strict naming convention.


## References

For additional context, refer to some of these links.

- [Terraform Standard Module Structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure) - HashiCorp's standard module structure is a file and directory layout we recommend for reusable modules distributed in separate repositories.
- [Terraform Module Requirements](https://www.terraform.io/docs/registry/modules/publish.html#requirements) - HashiCorp's guidance on all the requirements for publishing a module. Meeting the requirements for publishing a module is extremely easy.
- [Terraform `random_integer` Resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) - The resource random_integer generates random values from a given range, described by the min and max attributes of a given resource.
- [Terraform Version Pinning](https://www.terraform.io/docs/configuration/terraform.html#specifying-a-required-terraform-version) - The required_version setting can be used to constrain which versions of the Terraform CLI can be used with your configuration


## Help

**Got a question?** We got answers.

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-mwaa/issues), send us an [email][email] or join our [Slack Community][slack].

[![README Commercial Support][readme_commercial_support_img]][readme_commercial_support_link]

## DevOps Accelerator for Startups


We are a [**DevOps Accelerator**][commercial_support]. We'll help you build your cloud infrastructure from the ground up so you can own it. Then we'll show you how to operate it and stick around for as long as you need us.

[![Learn More](https://img.shields.io/badge/learn%20more-success.svg?style=for-the-badge)][commercial_support]

Work directly with our team of DevOps experts via email, slack, and video conferencing.

We deliver 10x the value for a fraction of the cost of a full-time engineer. Our track record is not even funny. If you want things done right and you need it done FAST, then we're your best bet.

- **Reference Architecture.** You'll get everything you need from the ground up built using 100% infrastructure as code.
- **Release Engineering.** You'll have end-to-end CI/CD with unlimited staging environments.
- **Site Reliability Engineering.** You'll have total visibility into your apps and microservices.
- **Security Baseline.** You'll have built-in governance with accountability and audit logs for all changes.
- **GitOps.** You'll be able to operate your infrastructure via Pull Requests.
- **Training.** You'll receive hands-on training so your team can operate what we build.
- **Questions.** You'll have a direct line of communication between our teams via a Shared Slack channel.
- **Troubleshooting.** You'll get help to triage when things aren't working.
- **Code Reviews.** You'll receive constructive feedback on Pull Requests.
- **Bug Fixes.** We'll rapidly work with you to fix any bugs in our projects.

## Slack Community

Join our [Open Source Community][slack] on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

## Discourse Forums

Participate in our [Discourse Forums][discourse]. Here you'll find answers to commonly asked questions. Most questions will be related to the enormous number of projects we support on our GitHub. Come here to collaborate on answers, find solutions, and get ideas about the products and services we value. It only takes a minute to get started! Just sign in with SSO using your GitHub account.

## Newsletter

Sign up for [our newsletter][newsletter] that covers everything on our technology radar.  Receive updates on what we're up to on GitHub as well as awesome new projects we discover.

## Office Hours

[Join us every Wednesday via Zoom][office_hours] for our weekly "Lunch & Learn" sessions. It's **FREE** for everyone!

[![zoom](https://img.cloudposse.com/fit-in/200x200/https://cloudposse.com/wp-content/uploads/2019/08/Powered-by-Zoom.png")][office_hours]

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-mwaa/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://cpco.io/help-out) with our other projects, we would love to hear from you! Shoot us an [email][email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!



## Copyrights

Copyright © 2022-2022 [Cloud Posse, LLC](https://cloudposse.com)





## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know by [leaving a testimonial][testimonial]!

[![Cloud Posse][logo]][website]

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We ❤️  [Open Source Software][we_love_open_source].

We offer [paid support][commercial_support] on all of our projects.

Check out [our other projects][github], [follow us on twitter][twitter], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.



### Contributors

<!-- markdownlint-disable -->
|  [![Erik Osterman][osterman_avatar]][osterman_homepage]<br/>[Erik Osterman][osterman_homepage] | [![Hugo Samayoa][htplbc_avatar]][htplbc_homepage]<br/>[Hugo Samayoa][htplbc_homepage] |
|---|---|
<!-- markdownlint-restore -->

  [osterman_homepage]: https://github.com/osterman
  [osterman_avatar]: https://img.cloudposse.com/150x150/https://github.com/osterman.png
  [htplbc_homepage]: https://github.com/htplbc
  [htplbc_avatar]: https://img.cloudposse.com/150x150/https://github.com/htplbc.png

[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudposse.com/logo-300x69.svg
  [docs]: https://cpco.io/docs?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=docs
  [website]: https://cpco.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=website
  [github]: https://cpco.io/github?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=github
  [jobs]: https://cpco.io/jobs?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=jobs
  [hire]: https://cpco.io/hire?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=hire
  [slack]: https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=slack
  [linkedin]: https://cpco.io/linkedin?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=linkedin
  [twitter]: https://cpco.io/twitter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=twitter
  [testimonial]: https://cpco.io/leave-testimonial?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=testimonial
  [office_hours]: https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=office_hours
  [newsletter]: https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=newsletter
  [discourse]: https://ask.sweetops.com/?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=discourse
  [email]: https://cpco.io/email?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=email
  [commercial_support]: https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=commercial_support
  [we_love_open_source]: https://cpco.io/we-love-open-source?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=we_love_open_source
  [terraform_modules]: https://cpco.io/terraform-modules?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=terraform_modules
  [readme_header_img]: https://cloudposse.com/readme/header/img
  [readme_header_link]: https://cloudposse.com/readme/header/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=readme_header_link
  [readme_footer_img]: https://cloudposse.com/readme/footer/img
  [readme_footer_link]: https://cloudposse.com/readme/footer/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=readme_footer_link
  [readme_commercial_support_img]: https://cloudposse.com/readme/commercial-support/img
  [readme_commercial_support_link]: https://cloudposse.com/readme/commercial-support/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-mwaa&utm_content=readme_commercial_support_link
  [share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-mwaa&url=https://github.com/cloudposse/terraform-aws-mwaa
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-mwaa&url=https://github.com/cloudposse/terraform-aws-mwaa
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/cloudposse/terraform-aws-mwaa
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/cloudposse/terraform-aws-mwaa
  [share_googleplus]: https://plus.google.com/share?url=https://github.com/cloudposse/terraform-aws-mwaa
  [share_email]: mailto:?subject=terraform-aws-mwaa&body=https://github.com/cloudposse/terraform-aws-mwaa
  [beacon]: https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/terraform-aws-mwaa?pixel&cs=github&cm=readme&an=terraform-aws-mwaa
