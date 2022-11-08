#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

echo "Cleaning up existing docs folders"
rm ./docs/workloads/*

export AWS_WEB_IDENTITY_TOKEN_FILE=/tmp/awscreds
config_location=$(pwd)
curl -H "Authorization: bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" "$ACTIONS_ID_TOKEN_REQUEST_URL&audience=sts.amazonaws.com" | jq -r '.value' > $AWS_WEB_IDENTITY_TOKEN_FILE

echo "Generating docs for Workloads"
for folder in $(cd src && ls -d */ | grep -v modules)
do
    echo "Generating docs for $folder"
    cd $config_location/src/$folder

    role_arn=$(cat aws-details.json | jq -r ".plan_role_arn")
    region=$(cat aws-details.json | jq -r '.region')

    echo "Role ARN: $role_arn"
    echo "Region: $region"

    export AWS_ROLE_ARN=$role_arn
    export AWS_DEFAULT_REGION=$region

    pwd
    terraform init
    terraform output --json > "$config_location/src/${folder::-1}/output_values.json"
    

    docker run --rm \
        --volume "$config_location/src/${folder::-1}:/terraform-docs" \
        --volume "$config_location/.terraform-docs.yml:/terraform-docs-config/.terraform-docs.yml" \
        -u "$(id -u)" \
        quay.io/terraform-docs/terraform-docs:0.16.0 \
        -c /terraform-docs-config/.terraform-docs.yml \
        markdown /terraform-docs > \
        ../../docs/workloads/${folder::-1}.md
done
