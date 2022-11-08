#!/usr/bin/env bash
set -e

if [ -f ./deploy/common.sh ]; then
  # shellcheck disable=SC1091
  source ./deploy/common.sh 
fi

echo -e "${GREEN_FG}Commencing Security checks...${COLOUR_RESET}"

cd ./"$1"

docker run --rm \
  -v "$(pwd)/src:/src" \
  --entrypoint="" \
  aquasec/tfsec:v1.0 \
  /bin/sh -c "tfsec -s ./src"
