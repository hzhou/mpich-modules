rm -rf yaksa

# commit=24cd2f2090665eebe5f8dc997fe5f7f2466acdd5
# commit=9ea097c7639ee8060d977200a42ac20be9f2a86e
commit=f4c0ee1b8f147148573b471fe4a6ac3e7644eaba

git clone https://github.com/pmodels/yaksa
cd yaksa
git checkout -b build $commit

sed -i -e 's/lib_LTLIBRARIES/noinst_LTLIBRARIES/' Makefile.am

sh autogen.sh
./configure
make

