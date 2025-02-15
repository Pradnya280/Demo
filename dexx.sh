#!/bin/bash -e
# -----------------------------------------------------------------------------
#
# Package       : dexx
# Version       : master (default)
# Source repo   : https://github.com/andrewoma/dexx.git
# Tested on     : UBI 8.3
# Language      : Java
# Travis-Check  : True
# Script License: Apache License, Version 2 or later
# Maintainer    : Pradnya Repal
#
# Disclaimer: This script has been tested in root mode on the given
# ========== platform using the mentioned version of the package.
# It may not work as expected with newer versions of the
# package and/or distribution. In such case, please
# contact the "Maintainer" of this script.
#
# -----------------------------------------------------------------------------
 
set -e
 
# Define variables
WORK_DIR=$(pwd)
PACKAGE_NAME="dexx"
PACKAGE_VERSION="${1:-master}"
PACKAGE_URL="https://github.com/andrewoma/dexx.git"
 
# Install dependencies
yum install -y git java-1.8.0-openjdk-devel
 
# Clone the repository
cd "$WORK_DIR"
git clone "$PACKAGE_URL"
cd "dexx"
git checkout "$PACKAGE_VERSION"
 
# Modify build.gradle without using patch
sed -i 's/jcenter()/mavenCentral()/g' build.gradle
sed -i "s/'com.github.ben-manes:gradle-versions-plugin:0.11.3'/'com.github.ben-manes:gradle-versions-plugin:0.11'/g" build.gradle
 
# Build the project
./gradlew build
 
echo "Build process for $PACKAGE_NAME completed successfully!"
