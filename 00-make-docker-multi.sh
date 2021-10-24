#!/bin/sh
set -e

# This script assumes that Docker has been configured with a default builder
# that supports multi-platforms.
#
# macOS builds are currently not supported due to cross compilation issues
# in github.com/albenik/go-serial/v2.

PAT_ROOT="../pat"

docker buildx build -f Dockerfile.other --platform linux/amd64 -o artifacts-other ${PAT_ROOT}/
docker buildx build -f Dockerfile.linux --platform linux/amd64,linux/386,linux/arm/v7 -o artifacts-linux ${PAT_ROOT}/
