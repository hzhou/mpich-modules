rm -rf izem

commit=f65bb810ab2957a4d98a63d5777a1bf206425718

git clone https://github.com/pmodels/izem
cd izem
git checkout -b build $commit

sh autogen.sh
./configure --enable-embedded
make
