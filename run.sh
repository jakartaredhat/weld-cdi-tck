#!/usr/bin/env bash

# Assumes this is run from the same directory as setup.sh, so need to cd into weld-core repo
pushd .
export JBOSS_HOME=`pwd`/wildfly-17.0.1.Final
cd weld-core

# Run embedded container tests:
mvn clean verify -f jboss-tck-runner/pom.xml
# Run incontainer, full EE set [1800+ tests]
mvn clean verify -Dincontainer -f jboss-tck-runner/pom.xml
#Run SE tests [30+ tests]
mvn clean verify -Dincontainer=se -f jboss-tck-runner/pom.xml
popd
