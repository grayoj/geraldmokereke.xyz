#!/bin/bash

echo "Clone and Serve"
git clone --recurse-submodules https://github.com/grayoj/gnotes
Hugo server hugo server -D