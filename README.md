# weld-cdi-tck

This project with a script for running CDI TCK against Weld/Wildfly. It consists of
two shell scripts:
* setup.sh - download and prepare the local environment to run the TCK
* run.sh - run the 3 sets of tests in the TCK

These two scripts are simply codification of the CDI TCK dist README.adoc into bash
commands.

# Setup
The setup.sh script performs the following actions:
* Download and unzip the CDI TCK dist
* Install the TCK artifacts into local repo
* Downloads and unzips the Wildfly/Weld runtime
* Gets the weld/core repo for TCK runner and install this into Wildfly runtime

# Run
the run.sh script runs the 3 sets of TCK tests:
* Run embedded container tests:
* Run incontainer, full EE set [1800+ tests]
* Run SE tests [30+ tests]
