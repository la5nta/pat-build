#!/bin/sh
set -e

# This script assumes that Docker has been configured with a default builder
# that supports multi-platforms.
#
# macOS builds are currently not supported due to cross compilation issues
# in github.com/albenik/go-serial/v2.

PAT_ROOT="../pat"

[ -d $GOVERSION ] && echo "GOVERSION not defined" && exit 1;

rm -rf artifacts-*/
docker buildx build --build-arg GOVERSION=$GOVERSION -f Dockerfile.raspbian --platform linux/arm/v6 -o artifacts-raspbian ${PAT_ROOT}/
docker buildx build --build-arg GOVERSION=$GOVERSION -f Dockerfile.other --platform linux/amd64 -o artifacts-other ${PAT_ROOT}/
docker buildx build --build-arg GOVERSION=$GOVERSION -f Dockerfile.debian --platform linux/amd64,linux/386,linux/arm64 -o artifacts-debian ${PAT_ROOT}/
