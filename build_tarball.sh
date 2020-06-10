#!/bin/bash
set -xe

if test -z "$MODULES" ; then
    MODULES="yaksa hwloc ucx libfabric json-c izem"
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
for dir in $MODULES ; do
    if test ! -d $dir ; then
        echo Not found: $dir
    else
        if test "$dir" != "ucx" ; then
            find $dir -name '*.o' |xargs rm -f
        fi
    fi
done

rm -rf */.git
tar czf ../modules.tar.gz $MODULES
