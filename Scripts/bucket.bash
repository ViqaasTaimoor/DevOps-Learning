#!/bin/bash

# -------- get inputs from user --------
read -p "Enter S3 bucket name (must be globally unique): " bucket
read -p "Enter AWS region (e.g. us-east-1): " region
read -p "Enter AWS CLI profile name: " profile

# -------- basic validation --------
if [ -z "$bucket" ] || [ -z "$region" ] || [ -z "$profile" ]; then
  echo "Error: bucket, region, and profile must all be provided."
  exit 1
fi

# -------- create bucket --------
if [ "$region" = "us-east-1" ]; then
  aws s3api create-bucket \
    --bucket "$bucket" \
    --profile "$profile"
else
  aws s3api create-bucket \
    --bucket "$bucket" \
    --region "$region" \
    --create-bucket-configuration LocationConstraint="$region" \
    --profile "$profile"
fi

# -------- verify --------
aws s3 ls --profile "$profile" | grep "$bucket"
