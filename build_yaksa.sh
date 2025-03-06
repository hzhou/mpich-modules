#!/bin/bash
set -xe

rm -rf yaksa

# commit=d44dfa922de0f25958d5cb2094284ff4984b5b5f
# commit=0ad6172b9658aef93e10cba6f47e36acf514e8d4
# commit=d4e16de491895bf1e4a3db4722fbd850cfc9bd93
# commit=e2c20536586216513c27bb1342fd346e7e64e728
# commit=0c42e3dc311ad965d963e5118320e314571899c8
# commit=5b169df10e8ab4c876f61dfb1d7a07fb41bb65a6
# commit=3314e2b65adcae38a372c22434923b3bced2d397
# commit=0c1fa65715abdfb0370127349c5d1ad99ea60366
# commit=911849b1e2f4a1e769ea8878cab3264d2cf3892d
# commit=9e307612e333a133357030d1b2f3dde4d9d43cce

# git clone https://github.com/pmodels/yaksa
# cd yaksa
# git checkout -b build $commit
if test ! -d mpich ; then
    git clone https://github.com/pmodels/mpich mpich
fi

cp -a mpich/src/mpi/datatype/typerep/yaksa .
cd yaksa

sh autogen.sh --pup-max-nesting=2
# take 1 optional configure argument, e.g. --with-cuda=/usr/local/cuda-11.1
./configure --enable-embedded --enable-debug $1
make

