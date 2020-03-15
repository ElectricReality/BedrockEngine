#!/bin/bash
sed -i -e "s/=SERVERNAME/=${WORLD}/g" "${MCSERVERFOLDER}/server.properties"
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
