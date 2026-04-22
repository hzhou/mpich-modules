#!/bin/bash
set -xe

commit=79ad1c9b9fcc846e6bc31f47b801d11ba6d8613a

rm -rf json-c

git clone https://github.com/pmodels/json-c
cd json-c
git checkout -b build $commit

# sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am
if test "$CC" = "suncc" ; then
    sed -i -e 's/const char/char/' strerror_override.c
fi

sh autogen.sh
./configure --enable-embedded --disable-werror
make

