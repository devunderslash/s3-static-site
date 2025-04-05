#!/bin/bash

# Exit on error
set -e

# Take input from command line for Bucket Name, AWS Profile, and Region
# Usage: ./deploy.sh <bucket_name> <aws_profile> <aws_region>
# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <bucket_name> <aws_profile> <aws_region>"
    exit 1
fi
# Assign command line arguments to variables
BUCKET_NAME="$1"
AWS_PROFILE="$2"
AWS_REGION="$3"

# Check if the bucket name is provided
if [ -z "$BUCKET_NAME" ]; then
    echo "Error: Bucket name is required."
    exit 1
fi

# Check if the AWS profile is provided
if [ -z "$AWS_PROFILE" ]; then
    echo "Error: AWS profile is required."
    exit 1
fi

# Check if the AWS region is provided
if [ -z "$AWS_REGION" ]; then
    echo "Error: AWS region is required."
    exit 1
fi

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "Error: AWS CLI is not installed. Please install it first."
    exit 1
fi


# Configuration
# BUCKET_NAME="sample-static-site-dev"  # Updated to match the actual bucket name
# AWS_PROFILE="devops"                 # AWS profile to use
# AWS_REGION="eu-west-2"              # Updated to match the region

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting file upload to S3...${NC}"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Upload files to S3
echo -e "${GREEN}Uploading files to S3...${NC}"
aws s3 sync . "s3://$BUCKET_NAME" \
    --exclude "*.git/*" \
    --exclude "deploy.sh" \
    --exclude "README.md" \
    --profile "$AWS_PROFILE" \
    --region "$AWS_REGION"

echo -e "${GREEN}Upload complete!${NC}"
echo -e "${GREEN}Note: Public access settings are managed by Terraform.${NC}"
echo -e "${GREEN}Website URL: http://$BUCKET_NAME.s3-website-$AWS_REGION.amazonaws.com${NC}" 