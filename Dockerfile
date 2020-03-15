FROM ubuntu

#Set ENV and ARG
ENV MCSERVERFOLDER=/srv/bedrockserver
ENV WORLD=Hello
ENV WORLD=${WORLD}
ARG INSTALLERURL=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.32.1.zip

#Install Dependencies
RUN apt-get update
RUN apt-get install -y curl unzip
RUN curl $INSTALLERURL --output mc.zip
RUN unzip mc.zip -d $MCSERVERFOLDER
RUN rm mc.zip

# Move in files
COPY default.permissions.json $MCSERVERFOLDER/worlds/default.permissions.json
COPY server.properties $MCSERVERFOLDER/server.properties
COPY whitelist.json $MCSERVERFOLDER/whitelist.json
COPY startup.sh /srv/bedrockserver/

RUN chmod +x /srv/bedrockserver/startup.sh
ENTRYPOINT ["/srv/bedrockserver/startup.sh"]
