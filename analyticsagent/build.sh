#!/bin/bash

packageName=$(basename `pwd`)

zipPkg=analytics-agent-20.6.0.2289.zip

docker build -f Dockerfile --build-arg ZIP_PKG=$zipPkg -t quackered/appd-$packageName .