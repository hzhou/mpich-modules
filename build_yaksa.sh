#!/bin/bash
set -xe

rm -rf yaksa

# commit=110f306ac5fc63af3a5d21ed63a70e053a4c483a
commit=be77809a822a3824a928f4ad08a74edc38b8068c

git clone https://github.com/pmodels/yaksa
cd yaksa
git checkout -b build $commit

sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am

sh autogen.sh
./configure
make

