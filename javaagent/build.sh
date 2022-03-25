#!/bin/bash

packageName=$(basename `pwd`)

zipPkg=AppServerAgent-22.2.0.33545.zip

docker build -f Dockerfile --build-arg ZIP_PKG=$zipPkg -t quackered/appd-$packageName .
