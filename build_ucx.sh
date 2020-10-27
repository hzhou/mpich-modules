#!/bin/bash
set -xe

commit=c1bac6ebd8d075b34f306fa17ea85330ff71103e

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

