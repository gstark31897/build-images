#!/bin/sh
set -e
home=$(pwd)

branch=$DRONE_BRANCH
if [ "$DRONE_BRANCH" == "latest" ]
then
    echo "latest is not a valid branch name for this repo"
    exit 1
elif [ "$DRONE_BRANCH" == "master" ]
then
    branch="latest"
fi

for project in $(ls -d */)
do
    project=${project%%/}
    echo building $project
    cd $project
    docker build . -t $project:$branch
    cd $home
done
