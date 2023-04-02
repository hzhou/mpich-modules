#!/bin/bash
set -e

if test -z "$MODULES" ; then
    MODULES="libtool yaksa hwloc ucx libfabric json-c mydef_boot"
fi

echo "Empty build..."
if test -d build ; then
    rm -rf build/*
else
    mkdir build
fi

echo "Copy $MODULES..."
# need preserve the timestamps
for a in $MODULES ; do
    if test -d $a ; then
        echo "    $a"
        cp -rp $a build/
    fi
done

cd build

echo "Leanify..."
# exclude ucx (since it need rebuild on install)
for dir in $MODULES ; do
    if test ! -d $dir ; then
        echo "    $dir: not found"
    else
        if test "$dir" != "ucx" ; then
            echo "    $dir"
            find $dir -name '*.o' |xargs rm -f
        fi
    fi
done

echo '    */.git'
rm -rf */.git

echo 'Create modules.tar.gz'
tar czf ../modules.tar.gz *
echo '    done.'
