#!/bin/bash

is_mac_target ()
{
    for arg in "$@"
    do
        if [[ "$arg" =~ --target=.+-apple- ]]; then
            return 0
        fi
    done
    return 1
}

is_arm_target ()
{
    for arg in "$@"
    do
        if [[ "$arg" =~ --target=aarch64 || "$arg" =~ --target=arm ]]; then
            return 0
        fi
    done
    return 1
}

if is_mac_target "$@"; then
    export SDKROOT=/usr/osxcross/SDK/MacOSX26.1.sdk

    if is_arm_target "$@"; then
        export TARGET_ARCH="aarch64"
    else
        export TARGET_ARCH="x86_64"
    fi

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
    export AR="/usr/osxcross/bin/${TARGET_ARCH}-apple-darwin${DARWIN_VERSION}-ar"
    export RANLIB="/usr/osxcross/bin/${TARGET_ARCH}-apple-darwin${DARWIN_VERSION}-ranlib"
    export TOOLCHAIN_PREFIX="/usr/osxcross/bin/${TARGET_ARCH}-apple-darwin${DARWIN_VERSION}-"
fi

# Allow for cross-compilation of OpenSSL
export PKG_CONFIG_ALLOW_CROSS=1

exec cargo "$@"