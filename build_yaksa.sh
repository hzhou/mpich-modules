#!/bin/bash
set -xe

rm -rf yaksa

# commit=110f306ac5fc63af3a5d21ed63a70e053a4c483a
# commit=be77809a822a3824a928f4ad08a74edc38b8068c
commit=d44dfa922de0f25958d5cb2094284ff4984b5b5f

git clone https://github.com/pmodels/yaksa
cd yaksa
git checkout -b build $commit

# sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am

sh autogen.sh
# take 1 optional configure argument, e.g. --with-cuda=/usr/local/cuda-11.1
./configure --enable-embedded $1
make

