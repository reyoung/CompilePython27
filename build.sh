#!/bin/bash
set -e
cd `dirname $0`
source ./common.sh

mkdir -p dist
DEST=$PWD/dist
cd cpython
./configure --enable-shared=no --with-threads --prefix=$DEST
make -j `nproc`
make  install
cd ../dist
cp ../python_rewrite_epath.sh ./install.sh
cp ../common.sh .
cp ../pip_install.sh .
cd bin
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
./python get-pip.py
rm get-pip.py
cd ../../
