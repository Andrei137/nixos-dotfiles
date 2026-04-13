#!/bin/bash

START_DIR="$PWD"
pushd ../../scripts > /dev/null
./setup.sh "$START_DIR"
popd > /dev/null
