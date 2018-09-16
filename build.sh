#!/bin/sh

set -ex

export IMAGE_NAME='gitee/yujianbo'

docker build --no-cache --pull -t ${IMAGE_NAME} ./

