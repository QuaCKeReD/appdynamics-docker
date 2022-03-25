#!/bin/bash

packageName=$(basename `pwd`)

zipPkg=machineagent-bundle-64bit-linux-22.2.0.3282.zip

docker build -f Dockerfile --build-arg ZIP_PKG=$zipPkg -t quackered/appd-$packageName .
