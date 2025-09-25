#!/bin/bash
set -e

# wipe old state
rm -rf ./logs ./config.json creds.txt

# download fresh jar on every start
echo "Downloading ThetaTerminalv3.jar..."
curl -sSL -o ThetaTerminalv3.jar https://download.thetadata.us/ThetaTerminalv3.jar

# check creds
if [[ -z "$THETA_V3_USER" || -z "$THETA_V3_PASS" ]]; then
  echo "Error: THETA_V3_USER and THETA_V3_PASS must be set"
  exit 1
fi

# write creds.txt
echo "$THETA_V3_USER" > creds.txt
echo "$THETA_V3_PASS" >> creds.txt

# launch
exec java -jar ThetaTerminalv3.jar