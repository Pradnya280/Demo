#!/bin/bash -e
# -----------------------------------------------------------------------------
#
# Package	    : listenablefuture
# Version	    : master
# Source repo	: https://github.com/google/guava.git
# Tested on	    : UBI 9.3
# Language      : Java
# Travis-Check  : True
# Script License: Apache License, Version 2 or later
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------
 
set -e
 
WORK_DIR=`pwd`
 
PACKAGE_NAME=guava/futures/listenablefuture9999
PACKAGE_VERSION=${1:master}
PACKAGE_URL=https://github.com/google/guava.git
 
yum install git maven java-11-openjdk-devel -y
 
#clone repo
cd $WORK_DIR
git clone $PACKAGE_URL
cd $PACKAGE_NAME
git checkout $PACKAGE_VERSION
 
mvn clean install -DskipTests
mvn test
