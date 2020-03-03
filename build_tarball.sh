rm -rf build/*

# need preserve the timestamps
cp -rp hwloc izem ucx libfabric json-c build/

cd build

# exclude ucx (since it need rebuild on install)
for dir in hwloc izem libfabric json-c ; do
    find $dir -name '*.o' |xargs rm -f
done

rm -rf */.git
tar czf ../modules.tar.gz hwloc izem ucx libfabric json-c
