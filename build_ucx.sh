#!/bin/bash
set -xe

commit=5477ae4ff6514bc8e6de66af7c02dfda16579dee

rm -rf ucx

git clone https://github.com/pmodels/ucx
cd ucx
git checkout -b build $commit

sh autogen.sh
./configure --prefix=/MODPREFIX --disable-static
make
find . -name '*.la' |xargs --verbose sed -i "s,$PWD,MODDIR,g"
cd ..
touch ucx/need_sed

