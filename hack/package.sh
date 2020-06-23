#!/usr/bin/env bash

# Copyright 2020 VMware, Inc.
# SPDX-License-Identifier: Apache-2.0

set -o errexit
set -o nounset
set -o pipefail

echo "$@"

if [ "$1" == "prepare" ]; then
  echo "prepare"
  ls
  mkdir -p dummy
  cat <<EOT >> dummy/main.go
package main

func main() {

}
EOT
elif [ "$1" == "cleanup" ]; then
  echo "prepare"
  ls
  echo "cleanup"
fi