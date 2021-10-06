#!/bin/bash
set -xe

# commit=c1bac6ebd8d075b34f306fa17ea85330ff71103e
commit=7fcdf34d37b602dab830360f1835a0c9eae81b0c

rm -rf ucx

git clone https://github.com/pmodels/ucx
cd ucx
git checkout -b build $commit

perl -p -i -e 'if (/^if HAVE_UCG/) {$skip = 1} elsif (/^EXTRA_DIST \+=/) {$skip = 0} if ($skip) {goto LINE}' Makefile.am 

sh autogen.sh
./configure --prefix=/MODPREFIX --disable-static --disable-numa
make
find . -name '*.la' |xargs --verbose sed -i "s,$PWD,MODDIR,g"
cd ..
touch ucx/need_sed

