#!/bin/bash
set -xe

# commit=a0a9395b8c954d6d8380f6c3fae8d5d48203272a
# commit=827a9fe6e6adc3589fd06d14f4c9e04e53d36760
# commit=ce145450cd19c64dc120ec6723af665498e1c141
# commit=b2b4e201b68c4992ee1d22812a764c9ad95a96a1
commit=1e6e14fd88518587204a13a6c9fa3acace73cdc8

rm -rf libfabric

git clone https://github.com/pmodels/libfabric
cd libfabric
git checkout -b build $commit

extra_option=
if test $(uname) = "FreeBSD" ; then
    extra_option='--disable-verbs'
fi

sh autogen.sh
./configure --enable-embedded --enable-debug $extra_option
make

find . -name '*.la' |xargs -t sed -i "s, -pthread,,g"
