#!/bin/bash
set -xe

# commit=a0a9395b8c954d6d8380f6c3fae8d5d48203272a
# commit=827a9fe6e6adc3589fd06d14f4c9e04e53d36760
# commit=ce145450cd19c64dc120ec6723af665498e1c141
# commit=b2b4e201b68c4992ee1d22812a764c9ad95a96a1
# commit=15c1dcb14d84eae903a459c63c095c02533dd92d
# commit=be81fb4bd78e768052587adb10f1b14fb24b5bf0
# commit=d451a4f14a11154879dc60177eb9a553137d4ef2
commit=cd605bae76821fbcdf83e73b594c793f0756968a

rm -rf libfabric

git clone https://github.com/pmodels/libfabric
cd libfabric
git checkout -b build $commit

extra_option=
if test $(uname) = "FreeBSD" ; then
    extra_option='--disable-verbs'
fi

sh autogen.sh
./configure --enable-embedded --enable-debug $extra_option $1
make

find . -name '*.la' |xargs -t sed -i "s, -pthread,,g"
