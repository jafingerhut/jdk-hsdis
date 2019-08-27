# Introduction

This repository contains copies of the hsdis source code from several
versions of the Java Development Kit (JDK) source code, and also one
slightly modified version of the code from JDK 12 that I have found
produces good results when building with recent versions of Ubuntu
like Ubuntu 18.04 desktop Linux.


# Files

These directories:

* `jdk10u-hsdis`
* `jdk11u-hsdis`
* `jdk12u-hsdis`

contain copies of the very few files that are in the `src/utils/hsdis`
directories of the JDK source code obtained via these commands, as of
2019-Aug-26:

* `hg clone https://hg.openjdk.java.net/jdk-updates/jdk10u`
* `hg clone https://hg.openjdk.java.net/jdk-updates/jdk11u`
* `hg clone https://hg.openjdk.java.net/jdk-updates/jdk12u`

Those repositories are about 1.7 Gbytes of downloads (files in the
`.hg` directory), and approximately another 1 Gbyte of files outside
of the `.hg` directory, so partly this repository lets you access
these files without having to wait for such clones to finish.


# Build instructions for Ubuntu 18.04 Linux

I have tested these instructions starting with a freshly installed
version of Ubuntu 18.04.3 Linux.

```bash
$ cd jdk12u-hsdis-modified
$ sudo apt-get install curl texinfo build-essential
$ BINUTILS_VER=2.31.1
$ curl -O https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VER}.tar.bz2
$ bzcat binutils-${BINUTILS_VER}.tar.bz2 | tar xkf -
$ make BINUTILS=binutils-${BINUTILS_VER} clean
$ make BINUTILS=binutils-${BINUTILS_VER}
```
