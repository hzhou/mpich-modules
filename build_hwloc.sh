rm -rf hwloc

git clone https://github.com/pmodels/hwloc
cd hwloc
git checkout -b build f535f0f338a58bf6dbe57b7c81c33b78f522b504

sh autogen.sh
./configure --enable-embedded-mode --enable-visibility
make

