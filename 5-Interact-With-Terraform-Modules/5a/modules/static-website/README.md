# AWS S3 Bucket to host a static website

- Terraform module which creates an S3 bucket configured to host a static website.

## Usage

```hcl
module "website" {
  source = "github.com/jeremycook123/s3_static_site_module"
  
  bucket_name = "bucket-1234abcd"

  create_random_suffix = true
  environment = "staging"

  tags = {
    Terraform = "true"
  }
}
```

### Generate Random bucket names

If `create_random_suffix = true`, the bucket name will include a randomly generated string to ensure the provided bucket name is unique. The default value is `false`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.70 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.website](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_bucket_policy.allow_public_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.allow_public_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [random_pet.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of S3 bucket for the website | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment bucket resides in | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Github owner to use when creating webhook | `map(string)` | `{}` | no |
| <a name="input_create_random_suffix"></a> [create\_random\_suffix](#input\_github\_token) | Add random suffix to bucket name | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_id"></a> [bucket\_arn](#output\_bucket\_id) | The id of the bucket |
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The arn of the bucket |
| <a name="output_bucket_website_endpoint"></a> [bucket\_website\_endpoint](#output\_bucket\_website\_endpoint) | The website endpoint of the domain |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/jeremycook123/s3_static_site_module/blob/main/LICENSE) for full details.