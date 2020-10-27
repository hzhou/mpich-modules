set -e

rm -rf libtool

mkdir libtool
cd libtool

cat <<EOF >configure.ac
AC_INIT
LT_INIT
AC_PROG_CXX
AC_PROG_F77
AC_PROG_FC
LT_OUTPUT
EOF

libtoolize -i
aclocal
autoconf

./configure --disable-static
