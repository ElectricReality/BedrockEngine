#!/bin/bash

if [ -z "$GAMEMODE" ]
then
      sed -i -e "s/gamemode=/gamemode=survival/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/gamemode=/gamemode=${GAMEMODE}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$DIFFICULTY" ]
then
      sed -i -e "s/difficulty=/difficulty=easy/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/difficulty=/difficulty=${DIFFICULTY}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$LEVEL_TYPE" ]
then
      sed -i -e "s/level-type=/level-type=DEFAULT/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/level-type=/level-type=${LEVEL_TYPE}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$SERVER_NAME" ]
then
      sed -i -e "s/server-name=/server-name=Dedicated Server/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/server-name=/server-name=${SERVER_NAME}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$MAX_PLAYERS" ]
then
      sed -i -e "s/max-players=/max-players=10/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/max-players=/max-players=${MAX_PLAYERS}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$SERVER_PORT" ]
then
      sed -i -e "s/server-port=/server-port=19132/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/server-port=/server-port=${SERVER_PORT}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$SERVER_PORTV6" ]
then
      sed -i -e "s/server-portv6=/server-portv6=19133/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/server-portv6=/server-portv6=${SERVER_PORTV6}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$LEVEL_NAME" ]
then
      sed -i -e "s/level-name=/level-name=level/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/level-name=/level-name=${LEVEL_NAME}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$LEVEL_SEED" ]
then
      sed -i -e "s/level-seed=/level-seed=/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/level-seed=/level-seed=${LEVEL_SEED}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$ONLINE_MODE" ]
then
      sed -i -e "s/online-mode=/online-mode=true/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/level-seed=/level-seed=${ONLINE_MODE}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$WHITE_LIST" ]
then
      sed -i -e "s/white-list=/white-list=false/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/white-list=/white-list=${WHITE_LIST}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$ALLOW_CHEATS" ]
then
      sed -i -e "s/allow-cheats=/allow-cheats=false/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/allow-cheats=/allow-cheats=${ALLOW_CHEATS}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$VIEW_DISTANCE" ]
then
      sed -i -e "s/view-distance=/view-distance=10/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/view-distance=/view-distance=${VIEW_DISTANCE}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$PLAYER_IDLE_TIMEOUT" ]
then
      sed -i -e "s/player-idle-timeout=/player-idle-timeout=30/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/player-idle-timeout=/player-idle-timeout=${PLAYER_IDLE_TIMEOUT}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$MAX_THREADS" ]
then
      sed -i -e "s/max-threads=/max-threads=8/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/max-threads=/max-threads=${MAX_THREADS}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$TICK_DISTANCE" ]
then
      sed -i -e "s/tick-distance=/tick-distance=4/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/tick-distance=/tick-distance=${TICK_DISTANCE}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$DEFAULT_PLAYER_PERMISSION_LEVEL" ]
then
      sed -i -e "s/default-player-permission-level=/default-player-permission-level=member/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/default-player-permission-level=/default-player-permission-level=${DEFAULT_PLAYER_PERMISSION_LEVEL}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$TEXTUREPACK_REQUIRED" ]
then
      sed -i -e "s/texturepack-required=/texturepack-required=false/g" "${MCSERVERFOLDER}/server.properties"
else
      sed -i -e "s/texturepack-required=/texturepack-required=${TEXTUREPACK_REQUIRED}/g" "${MCSERVERFOLDER}/server.properties"
fi

if [ -z "$WHITELIST" ]
then
      echo Not Setting Whitelist
else
      truncate -s 0 "${MCSERVERFOLDER}/whitelist.json"
      echo "$WHITELIST" > "${MCSERVERFOLDER}/whitelist.json"
fi

mkdir -p -- "${MCSERVERFOLDER}/worlds/default"
cd /${MCSERVERFOLDER}/
LD_LIBRARY_PATH=. ./bedrock_server
