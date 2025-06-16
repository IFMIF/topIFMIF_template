#!/bin/bash

for ioc in $(ls -d ioc_*/ | cut -f1 -d/); do
	echo "Building $ioc"
	podman build --target "$ioc" --tag "$ioc" .
done
