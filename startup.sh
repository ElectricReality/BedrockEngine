#!/bin/bash
echo ${WORLD}
sed -i -e "s/=19132/=${WORLD}/g" "${MCSERVERFOLDER}/server.properties"
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
