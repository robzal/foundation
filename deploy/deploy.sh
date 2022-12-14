#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

cd ./"$1"

echo -e "${GREEN_FG}Terraform setup...${COLOUR_RESET}"
terraform init

if [ -n "${AWS_ACCESS_KEY_ID:+x}" ] && [ -n "${AWS_SECRET_ACCESS_KEY:+x}" ]; then
  echo -e "AWS credentials in environment, Running terraform init and validate from $1"
  terraform init && terraform validate
fi

if [ "$2" == "false" ]; then
    echo -e "${GREEN_FG}Running Terraform Plan...${COLOUR_RESET}"
    terraform plan -lock=false
fi

if [ "$2" == "true" ]; then
    echo -e "${GREEN_FG}Running Terraform Apply...${COLOUR_RESET}"
    terraform apply -auto-approve
fi

if [ "$2" == "destroy" ]; then
    echo -e "${GREEN_BG}Running Terraform Destroy...${COLOUR_RESET}"
    terraform destroy -auto-approve
fi