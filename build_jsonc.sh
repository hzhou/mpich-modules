rm -rf json-c

git clone https://github.com/pmodels/json-c
cd json-c
# git checkout -b build 19173876e31921572bd55622a8589c30824a1eae
# git checkout -b build 995414fb9c5ad752b0a21f58a901960884f30aaf
git checkout -b build 5e7bbf9d39844cfc54c1821b19da87c3e8a1451d

# sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am
sed -i -e 's/const char/char/' strerror_override.c

sh autogen.sh
./configure --disable-werror
make

