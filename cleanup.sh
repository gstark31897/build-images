#!/bin/sh
set -e
for project in $(ls -d */)
do
    docker images $project | grep $DRONE_BRANCH | awk '{print $3}' | xargs docker rmi
done
