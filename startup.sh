#!/bin/bash

echo $permission

sed -i -e "s/=SERVERNAME/=${WORLD}/g" "${MCSERVERFOLDER}/server.properties"
sed -i -e "s/=19132/=${PORT}/g" "${MCSERVERFOLDER}/server.properties"
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
