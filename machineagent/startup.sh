#!/bin/sh

# echo "Setting up MACHINE_AGENT_PROPERTIES..."
# MACHINE_AGENT_PROPERTIES=""

echo "MACHINE_AGENT_PROPERTIES=$MACHINE_AGENT_PROPERTIES"

java ${MACHINE_AGENT_PROPERTIES} -jar ./machineagent.jar