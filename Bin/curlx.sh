#!/usr/bin/env bash

set -x

# usage: curlx <url> <file name>
for i in 1 2 3 4 5; do
  curl -C - --fail --progress-bar --retry 3 --retry-delay 5 -L "$1" -o "$2" && exit 0
  echo "[curlx] Download failed, retrying ($i/5)..."
  sleep $(( i * 5 ))
done

echo "[-] curlx: Failed to download $1"
exit 1
