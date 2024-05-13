#!/bin/bash
set -xe

# commit=c1bac6ebd8d075b34f306fa17ea85330ff71103e
# commit=60c20b0639cf349250a8655837417ec9f89399e7
# commit=6bf678e99d12e1b55a6949edb459a629fcd27ea4
commit=c2c60398690d75c75bdab333a392d64565e00ff7

rm -rf ucx

git clone https://github.com/pmodels/ucx
cd ucx
git checkout -b build $commit

perl -p -i -e 'if (/^if HAVE_UCG/) {$skip = 1} elsif (/^EXTRA_DIST \+=/) {$skip = 0} if ($skip) {goto LINE}' Makefile.am 

sh autogen.sh
./configure --prefix=/MODPREFIX --disable-static --disable-numa $1
make
find . -name '*.la' |xargs --verbose sed -i "s,$PWD,MODDIR,g"
cd ..
touch ucx/need_sed

