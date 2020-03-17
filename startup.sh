#!/bin/bash
if [ -z "$SERVER_NAME" ]
then
      echo "\$SERVER_NAME is empty"
else
      echo "\$SERVER_NAME is NOT empty"
fi

sed -i -e "s/=SERVERNAME/=${WORLD}/g" "${MCSERVERFOLDER}/server.properties"
sed -i -e "s/=19132/=${PORT}/g" "${MCSERVERFOLDER}/server.properties"
mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server





ARG GAMEMODE=${GAMEMODE}
ARG DIFFICULTY=${DIFFICULTY}
ARG LEVEL_TYPE=${LEVEL_TYPE}
ARG SERVER_NAME=${SERVER_NAME}
ARG MAX_PLAYERS=${MAX_PLAYERS}
ARG SERVER_PORT=${SERVER_PORT}
ARG SERVER_PORTV6=${SERVER_PORTV6}
ARG LEVEL_NAME=${LEVEL_NAME}
ARG LEVEL_SEED=${LEVEL_SEED}
ARG ONLINE_MODE=${ONLINE_MODE}
ARG WHITE_LIST=${WHITE_LIST}
ARG ALLOW_CHEATS=${ALLOW_CHEATS}
ARG VIEW_DISTANCE=${VIEW_DISTANCE}
ARG PLAYER_IDLE_TIMEOUT=${PLAYER_IDLE_TIMEOUT}
ARG MAX_THREADS=${MAX_THREADS}
ARG TICK_DISTANCE=${TICK_DISTANCE}
ARG DEFAULT_PLAYER_PERMISSION_LEVEL=${TICK_DISTANCE}
ARG TEXTUREPACK_REQUIRED=${TEXTUREPACK_REQUIRED}
