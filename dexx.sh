#!/bin/bash
# -----------------------------------------------------------------------------
# Package     : dexx
# Version     : latest (from repository)
# Source repo : https://github.com/andrewoma/dexx.git
# Tested on   : CentOS / RHEL (YUM-based systems)
# Language    : Java
# Script License: Apache License, Version 2 or later
# Maintainer  : Pradnya Repal
# Disclaimer  : This script has been tested on a fresh system with the mentioned setup.
#               Adjustments may be required for other environments.
# -----------------------------------------------------------------------------



# Install dependencies
yum install -y java-1.8.0-openjdk-devel git wget unzip nano

# Clone repository
git clone https://github.com/andrewoma/dexx.git
cd dexx || { echo "Repository not found!"; exit 1; }

# Modify build.gradle without using patch
sed -i 's/jcenter()/mavenCentral()/g' build.gradle
sed -i "s/'com.github.ben-manes:gradle-versions-plugin:0.11.3'/'com.github.ben-manes:gradle-versions-plugin:0.11'/g" build.gradle

# Verify changes
git diff build.gradle

# Build the project
./gradlew build

echo "Build process for $PACKAGE_NAME completed!"

