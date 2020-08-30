#!/bin/bash
set -xe

# commit=a2abb351ef6a58af5794757eb7f8d7a141ff2128
commit=a0a9395b8c954d6d8380f6c3fae8d5d48203272a

rm -rf libfabric

git clone https://github.com/pmodels/libfabric
cd libfabric
git checkout -b build $commit

sh autogen.sh
./configure --enable-embedded
make

