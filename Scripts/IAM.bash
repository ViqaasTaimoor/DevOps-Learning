#!/bin/bash

# Exit immediately if any command fails
set -e

echo "Starting IAM user creation script..."
echo "This script will create an IAM user and attach VPC Full Access permissions."

# -------------------------------
# Variables
# -------------------------------
user="vpc-user"
policy="arn:aws:iam::aws:policy/AmazonVPCFullAccess"

# -------------------------------
# Create IAM User
# -------------------------------
echo "Step 1: Creating IAM user: $user"

aws iam create-user --user-name $user

echo "IAM user '$user' created successfully."

# -------------------------------
# Attach VPC Full Access Policy
# -------------------------------
echo "Step 2: Attaching VPC Full Access policy to user: $user"

aws iam attach-user-policy \
  --user-name $user \
  --policy-arn $policy

echo "VPC Full Access policy attached successfully."

# -------------------------------
# Completion Message
# -------------------------------
echo "Script completed successfully."
echo "IAM user '$user' now has full access to VPC resources."
