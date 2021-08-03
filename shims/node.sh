#!/bin/bash

NODE_VERSION="${VARIABLE:-14.16.1}"

sudo docker run --rm \
  -v $PWD:$PWD:rw \
  node:$NODE_VERSION-alpine node "$@"
