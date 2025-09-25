#!/bin/bash
set -e

# wipe old state
rm -rf ./logs ./config.json creds.txt ThetaTerminalv3.jar

# default to unstable link if not provided
JAR_URL="${THETA_V3_JAR_URL:-https://download-unstable.thetadata.us/ThetaTerminalv3.jar}"

echo "Downloading ThetaTerminalv3.jar from $JAR_URL..."
curl -sSL -o ThetaTerminalv3.jar "$JAR_URL"

if [[ -z "$THETA_V3_USER" || -z "$THETA_V3_PASS" ]]; then
  echo "Error: THETA_V3_USER and THETA_V3_PASS must be set"
  exit 1
fi

echo "$THETA_V3_USER" > creds.txt
echo "$THETA_V3_PASS" >> creds.txt

exec java -jar ThetaTerminalv3.jar