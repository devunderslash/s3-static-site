# Dev Environment Configuration

This directory contains the Terraform configuration for the production environment.

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the changes:
```bash
terraform apply
```

## Configuration

The configuration creates a static website hosted on S3 with the following settings:
- Bucket name: `my-static-website-prod` (configurable via `local.tf`)
- Environment-specific tags
- Public read access for website hosting

## Variables

You can customize the deployment by modifying the values in `local.tf`:

- `bucket_name`: The name of the S3 bucket
- `tags`: Additional tags to apply to resources

## Outputs

The website url will output upon successful terraform apply