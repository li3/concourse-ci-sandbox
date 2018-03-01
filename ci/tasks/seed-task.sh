#!/bin/bash

set -e -x

echo "Trying to get one of these params to work..."
echo "${concourse-url}"

mv ./fly-release/fly_linux_amd64 ./fly
chmod +x ./fly
./fly -t local login -c ${concourse-url} -n ${concourse-team} -u ${concourse-username} -p ${concourse-password}
./fly -t local sync
./fly -t local set-pipeline -p "hello-world" -c ./source-code/ci/pipeline.yml -n
