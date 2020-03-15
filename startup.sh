#!/bin/bash
sed -i -e "s/=server-name/=${WORLD}/g" "${MCSERVERFOLDER}/server.properties"
sed -i -e "s/=level-name/=${WORLD}/g" "${MCSERVERFOLDER}/server.properties"
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
sed -i -e "s/=world/=${WORLD}/g" "${MCSERVERFOLDER}/worlds/default.properties"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
