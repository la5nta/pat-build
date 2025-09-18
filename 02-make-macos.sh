#!/bin/sh
set -e
PAT_ROOT="src"
VERSION=$(grep "Version =" ${PAT_ROOT}/internal/buildinfo/VERSION.go|cut -d '"' -f2)
ARCH=$(go env GOARCH)

if [ $(go env GOOS) != "darwin" ]; then
	echo "This step must be run on macOS" && exit 1
fi
if ! $(command -v packagesbuild >/dev/null 2>&1) ; then
	echo "WhiteBox Packages must be installed" && exit 1
fi
(cd ${PAT_ROOT}; ./make.bash;)

if [ -d $SIGNING_KEY ]; then
	echo "WARNING: No SIGNING_KEY set. Using unsigned pkg for distribution."
	mkdir -p dists
	cp ${PAT_ROOT}/pat_${VERSION}_darwin_${ARCH}_unsigned.pkg dists/pat_${VERSION}_darwin_${ARCH}.pkg
else
	productsign --sign "${SIGNING_KEY}" ${PAT_ROOT}/pat_${VERSION}_darwin_${ARCH}_unsigned.pkg dists/pat_${VERSION}_darwin_${ARCH}.pkg
fi
