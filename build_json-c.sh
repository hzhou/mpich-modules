#!/bin/bash
set -xe

commit=bb17282c1b87123271d352d307b9077685a05a92

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

