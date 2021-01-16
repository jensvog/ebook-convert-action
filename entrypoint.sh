#!/usr/bin/env bash

mkdir -p "$(dirname "${INPUT_OUT}")"
ebook-convert "$INPUT_IN" "$INPUT_OUT" $INPUT_ARGS
