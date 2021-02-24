#!/bin/bash
set -xe

# commit=fb27dc6e21bac14754d1b50b57f752e37d475704
commit=81f40274a0af59f7b3a152a1bae73fe8df09b968

rm -rf hwloc

git clone https://github.com/pmodels/hwloc
cd hwloc
git checkout -b build $commit

sh autogen.sh
export CFLAGS=-fvisibility=hidden
./configure --enable-embedded-mode --enable-visibility=no
make

