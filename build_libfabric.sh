#!/bin/bash
set -xe

# commit=a2abb351ef6a58af5794757eb7f8d7a141ff2128
commit=2a691d7c014080be4ca3e8c8c1cd9492b1dbc9e8
commit=03b24c3413a876408399d81e8b7475f9231a7ab8

rm -rf libfabric

git clone https://github.com/pmodels/libfabric
cd libfabric
git checkout -b build $commit

sh autogen.sh
./configure --enable-embedded
make

