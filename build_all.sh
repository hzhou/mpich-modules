CUDA=/usr/local/cuda

./build_libtool.sh
./build_hwloc.sh
./build_json-c.sh
if test "gpu" = "$1" ; then
    ./build_yaksa.sh --with-cuda=$CUDA
    ./build_libfabric.sh --with-cuda=$CUDA
    ./build_ucx.sh --with-cuda=$CUDA
else
    ./build_yaksa.sh
    ./build_libfabric.sh
    ./build_ucx.sh
fi
./build_izem.sh

./build_tarball.sh

if test "gpu" = "$1" ; then
    mv modules.tar.gz modules-gpu.tar.gz
fi
