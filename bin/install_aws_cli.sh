#!/usr/bin/env bash
PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
cd /workspace

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

cd $PROJECT_ROOT