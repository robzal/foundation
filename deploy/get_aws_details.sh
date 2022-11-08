#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

if [ "$2" == "true" ]; then
    json_property="apply_role_arn"
else 
    json_property="plan_role_arn"
fi

role_arn=$(cat $1/aws-details.json | jq -r ".$json_property")
region=$(cat $1/aws-details.json | jq -r '.region')

echo "Role ARN: $role_arn"
echo "Region: $region"

echo "::set-output name=role_arn::$role_arn"
echo "::set-output name=region::$region"
