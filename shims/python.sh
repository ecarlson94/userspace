#!/bin/bash

PYTHON_VERSION="${VARIABLE:-3.8}"

sudo docker run --rm \
  -v $PWD:$PWD:rw \
  python:$PYTHON_VERSION-alpine python "$@"
