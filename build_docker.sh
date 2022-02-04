#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <tag>"
  echo "e.g.: $0 20170620"
  echo "e.g.: $0 latest"
  exit 1
fi
TAG=$1


# enable docker buildkit to allow build secrets
export DOCKER_BUILDKIT=1


# build
docker build --progress=plain --rm --force-rm \
  -t hysds/rabbitmq:${TAG} -f docker/Dockerfile . || exit 1
docker system prune -f || :
