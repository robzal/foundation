#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

echo -e "${GREEN_BG}Commencing Styleguide and Syntax checks...${COLOUR_RESET}"

# shellcheck disable=SC2045
for folder in $(ls -d ./src/*); do
  number_of_main_tf=$(find "${folder}"/* -maxdepth 1 -name "main.tf" -printf '.' | wc -m)
  if [ "$number_of_main_tf" -gt "0" ]; then
      >&2 echo -e "Styleguide Issue - Name main.tf according to the resoruces it creates."
      exit 1
  else
      echo -e "No main.tf files found"
  fi

  number_of_variables_tf=$(find "${folder}"/* -maxdepth 1 -name "variables.tf" -printf '.' | wc -m)
  if [ "$number_of_variables_tf" -eq "1" ]; then
      echo -e "Variables.tf exists"
  else
      >&2 echo -e "Styleguide Issue - Missing variables.tf"
      exit 1
  fi

  number_of_outputs_tf=$(find "${folder}"/* -maxdepth 1 -name "outputs.tf" -printf '.' | wc -m)
  if [ "$number_of_outputs_tf" -eq "1" ]; then
      echo -e "outputs.tf exists"
  else
      >&2 echo -e "Styleguide Issue - Missing outputs.tf"
      exit 1
  fi

  number_of_providers_tf=$(find "${folder}"/* -maxdepth 1 -name "providers.tf" -printf '.' | wc -m)
  if [ "$number_of_providers_tf" -eq "1" ]; then
      echo -e "providers.tf exists"
  else
      >&2 echo -e "Styleguide Issue - Missing providers.tf"
      exit 1
  fi

  if [ -n "${AWS_ACCESS_KEY_ID:+x}" ] && [ -n "${AWS_ACCESS_KEY_SECRET:+x}" ]; then
    echo -e "AWS credentials in environment, Running terraform init and validate"
    cd "${folder}"
    terraform init && terraform validate
  fi
done

