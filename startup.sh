#!/bin/bash
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
sed -i -e "s/=world/=$WORLD/g" "${MCSERVERFOLDER}/worlds/default.properties"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
