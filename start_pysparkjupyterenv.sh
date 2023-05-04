#!/bin/bash

# Author: Non-Neutral Zero
# Copyright (c) Non-Neutral Zero

readonly ENV_DIRECTORY="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "${ENV_DIRECTORY}/.config/.scripts/args.sh"
print_args() {
  echo "$*"
}

build_image() {
    print "Building image ${IMAGE_NAME}"
    docker-compose  -f ${COMPOSE_FILE}.yml build
}

# docker-compose -f pysparkjupyterenv.yml down && docker-compose  -f pysparkjupyterenv.yml build
# docker-compose -f pysparkjupyterenv.yml up -d
# docker exec -u 0 -it pysparkjupyter_container service ssh start

main () {
  docker-compose -f ${COMPOSE_FILE}.yml down && build_image && docker-compose -f ${COMPOSE_FILE}.yml up -d 
  docker exec -u 0 -it ${CONTAINER_NAME} service ssh start
  docker run -it ${IMAGE_NAME}
}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
  main "$@"
fi
