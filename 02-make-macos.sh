#bin/sh
set -e
PAT_ROOT="../pat"
VERSION=$(grep "Version =" ${PAT_ROOT}/internal/buildinfo/VERSION.go|cut -d '"' -f2)

if [[ $(go env GOOS) != "darwin" ]]; then
	echo "This step must be run on macOS with packages and xcode installed."
fi
if [ -d $SIGNING_KEY ]; then
	echo "SIGNING_KEY not set"
	exit 1
fi

(cd ${PAT_ROOT}; ./make.bash;)
productsign --sign "${SIGNING_KEY}" ${PAT_ROOT}/pat_${VERSION}_darwin_amd64_unsigned.pkg dists/pat_${VERSION}_darwin_amd64.pkg
