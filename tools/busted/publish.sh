#!/bin/bash
CONTAINER_TAG=ouijan/lua:5.1-busted
docker image build -t $CONTAINER_TAG .
docker login
docker push $CONTAINER_TAG
