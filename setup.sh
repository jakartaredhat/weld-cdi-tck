#!/usr/bin/env bash

# Download and unzip the CDI TCK dist
wget http://download.eclipse.org/ee4j/cdi/cdi-tck-2.0.6-dist.zip
shasum -a 256 cdi-tck-2.0.6-dist.zip
unzip cdi-tck-2.0.6-dist.zip

# Install the TCK artifacts into local repo
pushd .
cd cdi-tck-2.0.6/artifacts
bash artifact-install.sh
popd

# Download Wildfly/Weld runtime
wget https://download.jboss.org/wildfly/17.0.1.Final/wildfly-17.0.1.Final.zip
unzip wildfly-17.0.1.Final.zip
export JBOSS_HOME=`pwd`/wildfly-17.0.1.Final

# Get the weld/core repo for TCK runner
git clone https://github.com/weld/core.git weld-core
cd weld-core
git checkout 3.1.1.Final
mvn clean package -Dtck -f jboss-as/pom.xml
