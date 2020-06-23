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
  if [[ ! -f "$2" ]]; then
    >&2 echo "$2 is not a valid file"
    exit 1
  fi
  parent_folder=$(dirname "$2")
  dist_path=$(dirname "$parent_folder")
  pushd "$dist_path"
  mv "$parent_folder"/release.yaml release.yaml
  rm -r "$parent_folder"
  popd
fi