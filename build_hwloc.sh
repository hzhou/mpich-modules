#!/bin/bash
set -xe

commit=f535f0f338a58bf6dbe57b7c81c33b78f522b504

rm -rf hwloc

git clone https://github.com/pmodels/hwloc
cd hwloc
git checkout -b build $commit

sh autogen.sh
export CFLAGS=-fvisibility=hidden
./configure --enable-embedded-mode --enable-visibility=no
make

