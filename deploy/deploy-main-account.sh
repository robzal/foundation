#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

S3_BUCKET='worxdesign-tfstate-ap-southeast-2'

echo -e "${GREEN_FG}Checking if Terraform remote state bootstrap needed${COLOUR_RESET}"
if aws s3api head-bucket --bucket "$S3_BUCKET" 2>/dev/null; then
    echo -e "Bucket exists"
else
    echo -e "Bucket doesn't exist"
    aws cloudformation deploy \
        --template-file ./deploy/remote_state.yml \
        --stack-name terraform-remote-state \
        --parameter-overrides StateBucketName=$S3_BUCKET LockTableName=$S3_BUCKET
fi

cd ./"$1"

echo -e "${GREEN_FG}Terraform setup...${COLOUR_RESET}"
terraform init

if terraform state show 'module.remote_state.aws_s3_bucket.tfstate' 2>/dev/null; then
    echo -e "S3 state already imported"
else
    echo -e "Importing S3 state"
    terraform import module.remote_state.aws_s3_bucket.tfstate $S3_BUCKET
fi

if terraform state show 'module.remote_state.aws_dynamodb_table.tfstate' 2>/dev/null; then
    echo -e "DynamoDB state already imported"
else
    echo -e "Importing DynamoDB state"
    terraform import module.remote_state.aws_dynamodb_table.tfstate $S3_BUCKET
fi

echo -e "${GREEN_BG}Commencing linting and Styleguide checks...${COLOUR_RESET}"
cd ../..
docker run --rm \
    -v "$(pwd)":/data \
    -v ~/.aws/:/root/.aws/:ro \
    --entrypoint="" \
    ghcr.io/terraform-linters/tflint:v0.34.1 \
    /bin/sh -c "cd ./$1 && pwd && ls -al && tflint --init -c ../../.tflint.hcl && tflint --module -c ../../.tflint.hcl"


cd ./"$1"

number_of_main_tf=$(find . -name "main.tf" -printf '.' | wc -m)
if [ "$number_of_main_tf" -gt "0" ]; then
    >&2 echo -e "Styleguide Issue - Name main.tf according to the resoruces it creates."
    exit 1
else
    echo -e "No main.tf files found"
fi

if [ "$2" == "false" ]; then
    echo -e "${GREEN_FG}Running Terraform Plan...${COLOUR_RESET}"
    terraform plan -lock=false
fi

if [ "$2" == "true" ]; then
    echo -e "${GREEN_BG}Running Terraform Apply...${COLOUR_RESET}"
    terraform apply -auto-approve
fi

