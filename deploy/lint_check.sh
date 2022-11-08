#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

echo -e "${GREEN_FG}Commencing Linting checks...${COLOUR_RESET}"

cd ./"$1"
docker run --rm --volume="$PWD":/check mstruebing/editorconfig-checker
echo -e "${GREEN_FG}Completed editorconfig-checker...${COLOUR_RESET}"
terraform fmt -recursive -check 

# If the AWS Creds are in the env then do deep checking, otherwise don't
if [ -n "${AWS_ACCESS_KEY_ID:+x}" ] && [ -n "${AWS_ACCESS_KEY_SECRET:+x}" ]; then
  sed -i 's/deep_check \= false/deep_check \= true/' ./.tflint.hcl
fi

docker run --rm \
    -v "$(pwd)":/data \
    -v ~/.aws/:/root/.aws/:ro \
    --entrypoint="" \
    ghcr.io/terraform-linters/tflint:v0.34.1 \
    /bin/sh -c "pwd && ls -al && tflint --init -c ./.tflint.hcl ./src && tflint --loglevel=info --module -c ./.tflint.hcl ./src"
