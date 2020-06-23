#!/usr/bin/env bash

# Copyright 2020 VMware, Inc.
# SPDX-License-Identifier: Apache-2.0

set -o errexit
set -o nounset
set -o pipefail

echo "$@"

if [ "$1" == "prepare" ]; then
  echo "prepare"
  mkdir -p dummy
  cat <<GOLANG > dummy/main.go
package main

func main() {

}
GOLANG
elif [ "$1" == "cleanup" ]; then
  rm -- *
  mv ko-release_darwin_amd64/release.yaml release.yaml
  rm -r release_darwin_amd64
fi