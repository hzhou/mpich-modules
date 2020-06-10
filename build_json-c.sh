#!/bin/bash
set -xe

commit=5e7bbf9d39844cfc54c1821b19da87c3e8a1451d

rm -rf json-c

git clone https://github.com/pmodels/json-c
cd json-c
git checkout -b build $commit

# sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am
if test "$CC" = "suncc" ; then
    sed -i -e 's/const char/char/' strerror_override.c
fi

sh autogen.sh
./configure --disable-werror
make

