# Project: AWS Infrastructure as Code (IaC) S3 website with Terraform
The following project is a simple web application hosted on AWS S3, using Terraform for infrastructure provisioning. The project includes a static HTML page and a deploy script to push the application to the infrastructure.
The goal is to demonstrate the use of Terraform for provisioning AWS resources, including S3 for static website hosting, and to provide a simple deployment process.

## Prerequisites
Before starting the project, ensure you have the following prerequisites in place:
- AWS CLI configured with access to the AWS account where you want to deploy the infrastructure.
- 2 AWS accounts (dev and prod) **Ideally this would be managed through AWS Organizations
- Terraform 
- AWS CLI
- 1 S3 bucket in each account for terraform state

## AWS CLI Configuration
- Configure the AWS CLI with your credentials. You can do this by running the following command:
```bash
aws configure
```
- Enter your AWS Access Key ID, Secret Access Key, default region name, and output format when prompted. You can create multiple profiles for different AWS accounts by using the `--profile` option.
- Example:
```bash
aws configure --profile devops
```
- You can check the configured profiles by running:
```bash
aws configure list-profiles
```

## Create S3 buckets
- Create an S3 bucket in each AWS account for storing Terraform state. Make sure to enable versioning and server-side encryption.
- Example bucket name: `terraform-state-dev` and `terraform-state-prod`
- Run the following command to create the buckets (profile optional):
```bash
aws s3api create-bucket --bucket devunderslash-state-dev --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2 --profile devops
```
- Enable versioning:
```bash
aws s3api put-bucket-versioning --bucket devunderslash-state-dev --versioning-configuration Status=Enabled --profile devops
```
- Remove the bucket when no longer needed:
```bash
aws s3api delete-bucket --bucket devunderslash-state-dev --profile devops
```

## Terraform 
To set up the infrastructure using Terraform, follow these steps:
- Ensure you are in the correct directory (if it doesn't exist, create it):
```bash
cd terraform/<region>/<env>
```
- Initialize Terraform:
```bash
terraform init
```
- Validate the Terraform configuration:
```bash
terraform validate
```
- Format the Terraform configuration:
```bash
terraform fmt
```
- Plan the Terraform deployment:
```bash
terraform plan
```
- Apply the Terraform configuration:
```bash
terraform apply
```
- Destroy the Terraform infrastructure:
```bash
terraform destroy
```
- If you find lockfile problems use the following flag: 
```bash
terraform <command> -lock=false
```

## Deploy Script
The simple deploy script will help with testing the solution prior to adding any CI/CD pipeline. The script will upload the static HTML page to the S3 bucket created by Terraform.
- Ensure you have the AWS CLI installed and configured.
- Update the simple HTML file (e.g., `index.html`) in the `application` directory.
- Run the deploy script:
```bash
./deploy.sh
```
- The script will upload the HTML file to the S3 bucket and make it publicly accessible.
- You can access the web application using the S3 bucket URL or the CloudFront distribution URL (if configured).
- Please note if you are using Cloudfront you will also need to invalidate the cache for changes to take effect. 



Checklist
- [x] Use Terraform to provision the infrastructure.
- [x] Use a supported backend for Terraform state (S3 Native).
- [x] Create a simple web application (e.g., a static HTML page).
- [x] Create simple deploy script to push it to infra (S3).
- [ ] Add temporary secrets to github repo for github actions.
- [ ] Ensure that changes to the HTML page trigger a redeployment.
- [x] Ensure that the DNS name or IP address remains the same after redeployment.
- [ ] Ensure that the application can be deployed to two different AWS accounts (e.g., dev and prod) with different parameters.
- [x] Store the Solution code in a GitHub repository.
- [x] Optionally, set up CI/CD for the deployment process.
- [ ] Optionally, use TLS for the web application.
- [ ] Optionally, use a custom domain name for the web application.
- [ ] Optionally, use CloudFront for content delivery.
- [ ] Optionally, use Route 53 for DNS management.