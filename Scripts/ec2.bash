#!/usr/bin/env bash

# ===== CONFIG =====
AMI_ID="ami-0abcdef1234567890"      # Replace with a valid AMI in your region
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-keypair"
SECURITY_GROUP_ID="sg-0123456789abcdef0"
SUBNET_ID="subnet-0123456789abcdef0"
REGION="ap-south-1"   # Mumbai region example

# ===== CREATE EC2 =====
echo "Launching EC2 instance..."

INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP_ID" \
  --subnet-id "$SUBNET_ID" \
  --count 1 \
  --region "$REGION" \
  --query "Instances[0].InstanceId" \
  --output text)

echo "Instance created: $INSTANCE_ID"

# ===== OPTIONAL: WAIT UNTIL RUNNING =====
echo "Waiting for instance to enter running state..."
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID" --region "$REGION"

echo "EC2 instance is now running."
