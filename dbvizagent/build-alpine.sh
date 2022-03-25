#!/bin/bash

packageName=$(basename `pwd`)

zipPkg=db-agent-22.2.0.2687.zip

docker build -f Dockerfile-alpine --build-arg ZIP_PKG=$zipPkg -t quackered/appd-$packageName:alpine .
