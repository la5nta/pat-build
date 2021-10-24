# pat-build

Scripts for building Pat releases.

```
# Create a new multi-arch Docker builder and set it as the default builder.
docker buildx create --name multi-arch
docker buildx use multi-arch

# Clone Pat into ../pat
git clone --branch releases/vX.Y.Z https://github.com/la5nta/pat ../pat

# Build Linux and Windows artifacts
./00-make-docker-multi.sh

# Prepare distributions
./01-make-dists

# Build and prepare macOS package
# Remember to ensure you're using the latest (stable) version of Go.
# This requires a valid Apple Developer Signing Certificate, xcode and WhiteBox' Packages.
SIGNING_KEY=G7CVWF7MFX ./02-make-macos

# Upload files to Github
ls dists/
```
