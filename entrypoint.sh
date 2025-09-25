#!/bin/bash
set -e

# wipe ephemeral state
rm -rf ./logs ./config.json creds.txt

if [[ -z "$THETA_V3_USER" || -z "$THETA_V3_PASS" ]]; then
  echo "Error: THETA_V3_USER and THETA_V3_PASS must be set"
  exit 1
fi

echo "$THETA_V3_USER" > creds.txt
echo "$THETA_V3_PASS" >> creds.txt

exec java -jar ThetaTerminalv3.jar