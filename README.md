# Introduction

This repository contains copies of the hsdis source code from several
versions of the Java Development Kit (JDK) source code, and also one
slightly modified version of the code from JDK 12 that I have found
produces good results when building with recent versions of Ubuntu
like Ubuntu 18.04 desktop Linux.


# Usage

If you want not to build the hsdis library from source code, but use
one that has been compiled already and included in the `prebuilt`
directory, install a JDK on your system, set the `JAVA_HOME`
environment variable to point at that installation, and run this shell
script:

```bash
$ ./bin/install-hsdis-into-jdk-ubuntu.sh
```

At this time, this has only been tested to work on these systems:

* Ubuntu 16.04.6 64-bit (amd64) desktop Linux
* Ubuntu 18.04.3 64-bit (amd64) desktop Linux

If you have more than one JDK installed on your system, and wish to
use this library on all of them, you must run that script multiple
times, each time with JAVA_HOME set to a different JDK install
directory.


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
$ ./bin/build-hsdis-ubuntu.sh
```
