#!/bin/sh
docker run --rm \
    -v cargo_registry:/usr/local/cargo/registry \
    -v cargo_git:/usr/local/cargo/git \
    -v "$(pwd):/work" \
    -w=/work \
    ghcr.io/agavrilov01/rust-cross-compile-x86_64 \
    cross-cargo.sh \
    "$@"
