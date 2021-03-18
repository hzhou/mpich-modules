#!/bin/bash
set -xe

rm -rf yaksa

# commit=d44dfa922de0f25958d5cb2094284ff4984b5b5f
commit=0ad6172b9658aef93e10cba6f47e36acf514e8d4

git clone https://github.com/pmodels/yaksa
cd yaksa
git checkout -b build $commit

# sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am

sh autogen.sh
# take 1 optional configure argument, e.g. --with-cuda=/usr/local/cuda-11.1
./configure --enable-embedded $1
make

