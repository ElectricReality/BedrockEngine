#!/bin/bash
echo ${WORLD}
sed -i -e "s/=SERVERNAME/=${WORLD}/g" "${MCSERVERFOLDER}/worlds/default.properties"
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
