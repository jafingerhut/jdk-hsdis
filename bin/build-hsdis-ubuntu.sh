#! /bin/bash

cd jdk12u-hsdis-modified
sudo apt-get install curl texinfo build-essential
BINUTILS_VER=2.31.1
curl -O https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VER}.tar.bz2
bzcat binutils-${BINUTILS_VER}.tar.bz2 | tar xkf -
make BINUTILS=binutils-${BINUTILS_VER} clean
make BINUTILS=binutils-${BINUTILS_VER}
