#!/bin/sh
exec /usr/osxcross/bin/o64-clang -mmacosx-version-min=10.15 -target x86_64-apple-darwin21.1 -B /usr/osxcross/bin -isysroot /usr/osxcross/SDK/MacOSX12.0.sdk $*
