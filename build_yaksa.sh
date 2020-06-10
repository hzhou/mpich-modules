#!/bin/bash
set -xe

rm -rf yaksa

commit=f4c0ee1b8f147148573b471fe4a6ac3e7644eaba

git clone https://github.com/pmodels/yaksa
cd yaksa
git checkout -b build $commit

sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am

sh autogen.sh
./configure
make

