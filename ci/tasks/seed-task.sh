#!/bin/bash

set -e -x

echo "Trying to get one of these params to work..."
echo $concourse_url

mv ./fly-release/fly_linux_amd64 ./fly
chmod +x ./fly
./fly -t local login -c $concourse_url -n $concourse_team -u $concourse_username -p $concourse_password
./fly -t local sync
./fly -t local set-pipeline -p "hello-world" -c ./source-code/ci/pipeline.yml -n
