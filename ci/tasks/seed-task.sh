#!/bin/bash

set -e -x

mv ./fly-release/fly_linux_amd64 ./fly
chmod +x ./fly
./fly -t local login -c $3 -n $4 -u $1 -p $2
./fly -t local sync
./fly -t local set-pipeline -p $5 -c ./source-code/ci/pipeline.yml -n
