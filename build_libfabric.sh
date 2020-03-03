git clone https://github.com/pmodels/libfabric
cd libfabric
git checkout -b build a2abb351ef6a58af5794757eb7f8d7a141ff2128

sh autogen.sh
./configure --enable-embedded --disable-verbs
make

