#!/bin/sh

set -ex

export SERVICE_NAME='pilipa-inside-git'
export IMAGE_NAME='gitee/yujianbo'

#docker service rm pilipa-inside-git

sleep 2

docker service create \
    --name "$SERVICE_NAME" \
    --hostname git.local.com \
    --network my-network \
    --replicas 1 \
    --publish "mode=host,published=22,target=22" \
    --publish "mode=host,published=80,target=80" \
    --publish "mode=host,published=443,target=443" \
    --mount type=bind,src=/srv/volume/git/config,dst=/etc/gitlab \
    --mount type=bind,src=/srv/volume/git/logs,dst=/var/log/gitlab \
    --mount type=bind,src=/srv/volume/git/data,dst=/var/opt/gitlab \
"$IMAGE_NAME"
