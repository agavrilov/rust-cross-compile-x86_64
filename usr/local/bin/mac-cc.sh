#!/bin/sh
exec /usr/osxcross/bin/o64-clang -mmacosx-version-min=10.15 -target "${TARGET_ARCH}-apple-darwin${DARWIN_VERSION}" -B /usr/osxcross/bin -isysroot "${SDKROOT}" "$@"
