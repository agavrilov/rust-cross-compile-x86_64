#!/bin/bash

is_mac_target ()
{
    for arg in "$@"
    do
        if [ "--target=x86_64-apple-darwin" = "$arg" ]; then
            return 0
        fi
    done
    return 1
}

if is_mac_target "$@"; then
    # ensures that the host and target compilers are explicitly set, including using
    # wrappers for clang for the target to pass parameters to clang that help a lot
    # of native code more reliably compile
    export HOST_CC=gcc
    export HOST_CXX=g++
    export CC=mac-cc.sh
    export CXX=mac-c++.sh
    export CPP="mac-cc.sh -E"

    # these help resolve issues that can arise with assembly and linking
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/osxcross/lib"
    export AR="/usr/osxcross/bin/x86_64-apple-darwin19-ar"
    export RANLIB="/usr/osxcross/bin/x86_64-apple-darwin19-ranlib"
    export TOOLCHAIN_PREFIX="/usr/osxcross/bin/x86_64-apple-darwin19-"
fi

# Allow for cross-compilation of OpenSSL
export PKG_CONFIG_ALLOW_CROSS=1

exec cargo "$@"