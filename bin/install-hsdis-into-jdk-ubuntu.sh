#! /bin/bash

if [ "x"${JAVA_HOME} != "x" ]
then
    if [ -d "${JAVA_HOME}" ]
    then
	echo "JAVA_HOME=${JAVA_HOME} environment variable set and names an existing directory"
    else
	echo "JAVA_HOME=${JAVA_HOME} environment variable set, but there is no such directory."
	echo "Ensure it names an existing directory of a Java installation on your system."
	exit 1
    fi
else
    echo "JAVA_HOME environment variable is not set."
    echo "Ensure it names an existing directory of a Java installation on your system."
    echo ""
    echo "One straightforward way to achieve that is to install a JDK like"
    echo "AdoptOpenJDK: https://adoptopenjdk.net"
    echo ""
    echo "This can be done with no superuser privileges on your system, and this"
    echo "script will then be able to copy a file into the JDK installation"
    echo "without superuser privileges."
    echo ""
    echo "If you are using a JDK installed via the apt package manager, e.g. via"
    echo "a package with a name like openjdk-11-jdk-headless, and you have"
    echo "superuser privileges on your system and are willing to copy a file"
    echo "into this JDK installation, you can try these instructions.  First"
    echo "find out where your Java executable is installed using this command:"
    echo ""
    echo "$ update-alternatives --display java"
    echo ""
    echo "In the output you should see a line like this:"
    echo ""
    echo "  link best version is /usr/lib/jvm/java-11-openjdk-amd64/bin/java"
    echo ""
    echo "Remove the '/bin/java' suffix from that to get the directory name"
    echo "/usr/lib/jvm/java-11-openjdk-amd64 to use for JAVA_HOME."
    echo ""
    echo "Then run this script again using a command like the one below,"
    echo "substituting the appropriate directory for your system:"
    echo ""
    echo "$ sudo JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 ./bin/ubuntu-hsdis-install.sh"
    exit 1
fi

echo ""
JAVA_ARCH=`clojure -m leeuwenhoek.get-os-arch`
echo "JAVA_ARCH=${JAVA_ARCH}"
LINUX_ARCH=`uname -m`
echo "LINUX_ARCH=${LINUX_ARCH}"

# In my testing, for AdoptOpenJDK 8, the hsdis .so file needed to be copied
# into the arch-specific directory, but for AdoptOpenJDK 11, it only worked
# if it was in the ${JAVA_HOME}/lib directory.  Rather than trying to figure
# out which kind of JDK is installed at ${JAVA_HOME}, just copy it into both
# places and hopefully that will do no harm.

DST_DIR1="${JAVA_HOME}/lib"
DST_DIR2="${JAVA_HOME}/lib/${JAVA_ARCH}"
set -x
mkdir -p "${DST_DIR1}"
# TBD: update
#cp -p /usr/lib/${LINUX_ARCH}-linux-gnu/libhsdis.so.0.0.0 "${DST_DIR1}/hsdis-${JAVA_ARCH}.so"
mkdir -p "${DST_DIR2}"
# TBD: update
#cp -p /usr/lib/${LINUX_ARCH}-linux-gnu/libhsdis.so.0.0.0 "${DST_DIR2}/hsdis-${JAVA_ARCH}.so"
