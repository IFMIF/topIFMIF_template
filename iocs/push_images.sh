#!/bin/bash

# Find the name of the repository itself, which will be something like topIFMIF_xxx
REPO=`basename $(git rev-parse --show-toplevel)`

# Push all the 
for ioc in $(ls -d *_ioc/ | cut -f1 -d/); do
	echo "Uploading ${REPO,,}_${ioc}"
	podman push --compression-format=zstd "${ioc}" "containers.ifmif.org/${REPO,,}_${ioc}"
done
