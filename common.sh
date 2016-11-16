#!/bin/bash
unset PATH
unset LD_LIBRARY_PATH
export PATH=/bin:/usr/bin
TOOLCHAIN_DIR=/opt/compiler/gcc-4.8.2
export CC=$TOOLCHAIN_DIR/bin/gcc
export CXX=$TOOLCHAIN_DIR/bin/g++
