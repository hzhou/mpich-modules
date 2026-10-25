CUDA=/usr/local/cuda
HIP=/usr/local/rocm

git clone https://github.com/pmodels/mpich

./build_libtool.sh
./build_hwloc.sh
if test "gpu" = "$1" ; then
    ./build_yaksa.sh --with-cuda=$CUDA
    ./build_libfabric.sh --with-cuda=$CUDA
    ./build_ucx.sh --with-cuda=$CUDA
elif test "hip" = "$1" ; then
    ./build_yaksa.sh --with-hip=$HIP
    ./build_libfabric.sh --with-rocr=$HIP
    ./build_ucx.sh --with-rocm=$HIP
else
    ./build_yaksa.sh
    ./build_libfabric.sh
    ./build_ucx.sh
fi
# ./build_izem.sh

git clone https://github.com/hzhou/mydef_boot

./build_tarball.sh

if test "gpu" = "$1" ; then
    mv modules.tar.gz modules-gpu.tar.gz
elif test "hip" = "$1" ; then
    mv modules.tar.gz modules-hip.tar.gz
fi
