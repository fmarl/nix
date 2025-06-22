#!/bin/sh

expr=$(cat "$1")
./../build/src/nix/nix eval --expr "$expr" > /dev/null