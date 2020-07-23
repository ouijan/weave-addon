#!/bin/bash
PROJECT_PATH="."
DIR_PATH="$(pwd -P)/$PROJECT_PATH"

docker run -i --rm \
  -v "$DIR_PATH":/data \
  ouijan/lua:5.1-busted
