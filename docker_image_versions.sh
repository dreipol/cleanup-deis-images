#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

docker images | tr -s " " | cut -d " " -f1,2
