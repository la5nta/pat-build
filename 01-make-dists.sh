#!/bin/sh
set -e
PAT_ROOT="../pat"
VERSION=$(grep "Version =" ${PAT_ROOT}/internal/buildinfo/VERSION.go|cut -d '"' -f2)

function build_tarball {
	BINARY_PATH="$1"
	NAME="$2"
	GZIP=-9

	mkdir -p dists/${NAME}
	cp ${BINARY_PATH} dists/${NAME}/
	tar -czvf dists/${NAME}.tar.gz -C dists/ ${NAME}
	rm -rf dists/${NAME}
}

function build_zip {
	BINARY_PATH="$1"
	NAME="$2"
	mkdir -p dists/${NAME}
	cp ${BINARY_PATH} dists/${NAME}/
	cd dists; zip -9 -r ${NAME}.zip ${NAME}; cd ..;
	rm -rf dists/${NAME}
}

rm -rf dists

# windows/386
build_zip artifacts-other/windows_386/pat pat_${VERSION}_windows_i386

# darwin/amd64
#cp artifacts-other/darwin_amd64/pat_${VERSION}_darwin_amd64.pkg dists/

# linux/386
build_tarball artifacts-linux/linux_386/pat pat_${VERSION}_linux_i386 
cp artifacts-linux/linux_386/pat_${VERSION}_i386.deb dists/pat_${VERSION}_linux_i386.deb

# linux/amd64
build_tarball artifacts-linux/linux_amd64/pat pat_${VERSION}_linux_amd64
cp artifacts-linux/linux_amd64/pat_${VERSION}_amd64.deb dists/pat_${VERSION}_linux_amd64.deb

# linux/armv7
cp artifacts-linux/linux_arm_v7/pat_${VERSION}_armhf.deb dists/pat_${VERSION}_linux_armhf.deb
