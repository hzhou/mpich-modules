#!/bin/bash
set -xe

commit=366f1c6c0ea2ca2f1077c1296f5cb744336fac38

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

