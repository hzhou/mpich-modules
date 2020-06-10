rm -rf izem

commit=7ab2efa1d35c81e0d90200d2066a22b3abb8db5f

git clone https://github.com/pmodels/izem
cd izem
git checkout -b build $commit

sh autogen.sh
./configure --enable-embedded
make
