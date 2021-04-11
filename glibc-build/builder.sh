#!/bin/bash

set -eo pipefail
[[ "$TRACE" ]] && set -x

version=$GLIBC_VERSION
prefix=$PREFIX_DIR

main() {
    wget -qO- "https://ftpmirror.gnu.org/libc/glibc-$version.tar.gz" | tar zxf -
    mkdir -p /glibc-build /glibc-tar && cd /glibc-build
    "/glibc-$version/configure" --prefix="$prefix" --libdir="$prefix/lib" --libexecdir="$prefix/lib" --enable-multi-arch --enable-stack-protector=strong
    make -j 4 && make install
    tar --dereference --hard-dereference -zcf "/glibc-tar/glibc-bin-$version.tar.gz" "$prefix"
}

main "$@"
