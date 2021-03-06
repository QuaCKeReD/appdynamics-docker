#!/bin/sh

echo "Setting up DB_AGENT_PROPERTIES..."

DB_AGENT_PROPERTIES=""

if [ -n "$APPDYNAMICS_CONTROLLER_HOST_NAME" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.controller.hostName=$APPDYNAMICS_CONTROLLER_HOST_NAME"
fi

if [ -n "$APPDYNAMICS_CONTROLLER_PORT" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.controller.port=$APPDYNAMICS_CONTROLLER_PORT"
fi

if [ -n "$APPDYNAMICS_CONTROLLER_SSL_ENABLED" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.controller.ssl.enabled=$APPDYNAMICS_CONTROLLER_SSL_ENABLED"
fi

if [ -n "$APPDYNAMICS_DB_AGENT_NAME" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Ddbagent.name=$APPDYNAMICS_DB_AGENT_NAME"
fi

if [ -n "$APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.agent.accountAccessKey=$APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY"
    echo "Property -appdynamics.agent.accountAccessKey successfully read"
fi

if [ -n "$APPDYNAMICS_AGENT_UNIQUE_HOST_ID" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.agent.uniqueHostId=$APPDYNAMICS_AGENT_UNIQUE_HOST_ID"
fi

if [ -n "$APPDYNAMICS_AGENT_ACCOUNT_NAME" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.agent.accountName=$APPDYNAMICS_AGENT_ACCOUNT_NAME"
fi

if [ -n "$APPDYNAMICS_AGENT_PROXY_HOST" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.http.proxyHost=$APPDYNAMICS_AGENT_PROXY_HOST"
fi

if [ -n "$APPDYNAMICS_AGENT_PROXY_PORT" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.http.proxyPort=$APPDYNAMICS_AGENT_PROXY_PORT"
fi

if [ -n "$APPDYNAMICS_AGENT_PROXY_USER" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.http.proxyUser=$APPDYNAMICS_AGENT_PROXY_USER"
fi

if [ -n "$APPDYNAMICS_AGENT_PROXY_PASS" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} -Dappdynamics.http.proxyPasswordFile=$APPDYNAMICS_AGENT_PROXY_PASS"
fi

if [ -n "$APPDYNAMICS_DB_PROPERTIES" ]; then
    DB_AGENT_PROPERTIES="${DB_AGENT_PROPERTIES} $APPDYNAMICS_DB_PROPERTIES"
fi

echo "DB_AGENT_PROPERTIES=$DB_AGENT_PROPERTIES"
echo "APPDYNAMICS_DB_AGENT_NAME=$APPDYNAMICS_DB_AGENT_NAME"

java ${DB_AGENT_PROPERTIES} -jar ./db-agent.jar
