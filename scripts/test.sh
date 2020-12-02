#!/bin/bash

set -eu

base=$(pwd)

echo "-------------------------------------------------------------------------"
echo "running tests"
echo "-------------------------------------------------------------------------"
docker run --rm -v "$base":/src -w /src/ swift-lambda-builder bash -c "swift test --enable-test-discovery"
echo "done"
