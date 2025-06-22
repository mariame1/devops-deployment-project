#!/bin/bash

EC2_USER="ubuntu"
EC2_IP="34.234.74.38"
KEY_PATH="$HOME/.ssh/app-deploy-key.pem"  # or: ~/.ssh/app-deploy-key.pem

echo "[Deploying to EC2 at $EC2_IP]"

scp -v -i "$KEY_PATH" -r * "$EC2_USER@$EC2_IP:/home/ubuntu/devops-project/"

