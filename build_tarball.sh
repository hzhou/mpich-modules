if -z "$MODULES" ; then
    MODULES="hwloc izem ucx libfabric json-c"
fi

if test -d build ; then
    rm -rf build/*
else
    mkdir build
fi


# need preserve the timestamps
cp -rp $MODULES build/

cd build

# exclude ucx (since it need rebuild on install)
for dir in hwloc izem libfabric json-c ; do
    find $dir -name '*.o' |xargs rm -f
done

rm -rf */.git
tar czf ../modules.tar.gz $MODULES
