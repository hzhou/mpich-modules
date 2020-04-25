rm -rf yaksa

git clone https://github.com/pmodels/yaksa
cd yaksa
git checkout -b build 24cd2f2090665eebe5f8dc997fe5f7f2466acdd5

sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am

sh autogen.sh
./configure
make

