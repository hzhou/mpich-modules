#!/bin/bash
set -xe

commit=a2abb351ef6a58af5794757eb7f8d7a141ff2128

rm -rf libfabric

git clone https://github.com/pmodels/libfabric
cd libfabric
git checkout -b build $commit

sh autogen.sh
./configure --enable-embedded --disable-verbs
make

