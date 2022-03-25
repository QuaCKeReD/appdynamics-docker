#!/bin/bash

packageName=$(basename `pwd`)

zipPkg=appd-netviz-x64-linux-21.3.0.2181.zip

docker build -f Dockerfile --build-arg ZIP_PKG=$zipPkg -t quackered/appd-$packageName .
