#!/bin/bash

# Exit immediately if any command fails
set -e

# Prompt for IAM username
read -p "Enter IAM username: " user

# Validate input
if [ -z "$user" ]; then
  echo "Error: Username cannot be empty"
  exit 1
fi

policy="arn:aws:iam::aws:policy/AmazonVPCFullAccess"

# Create IAM user
echo "Creating IAM user: $user"
aws iam create-user --user-name "$user"

# Attach VPC Full Access policy
echo "Attaching VPC Full Access policy"
aws iam attach-user-policy \
  --user-name "$user" \
  --policy-arn "$policy"

echo "User '$user' created with VPC Full Access"
