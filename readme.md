# Bedrock Engine
A Minecraft Bedrock server that you only need to set Environment Variables for server.properties, permissions.json and whitelist.json. Uses Docker.

## Environment Variables
Taken from http://192.95.46.1/jar/bedrock/bedrock_server_how_to.html

| Option name                     | Possible values                              | Default value    | When is it used                | Notes                                                                                                                                                                                                                                                                                                   |
|---------------------------------|----------------------------------------------|------------------|--------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GAMEMODE                        | survival (0), creative (1), adventure (2)    | survival         | Always or only for new players |                                                                                                                                                                                                                                                                                                         |
| DIFFICULTY                      | peaceful (0), easy (1), normal (2), hard (3) | easy             | Always                         |                                                                                                                                                                                                                                                                                                         |
| LEVEL_TYPE                      | FLAT, LEGACY, DEFAULT                        | DEFAULT          | World creation                 |                                                                                                                                                                                                                                                                                                         |
| SERVER_NAME                     | Any string                                   | Dedicated Server | Always                         | This is the server name shown in the in-game server list.                                                                                                                                                                                                                                               |
| MAX_PLAYERS                     | Any integer                                  | 10               | Always                         | The maximum numbers of players that should be able to play on the server. Higher values have performance impact.                                                                                                                                                                                        |
| SERVER_PORT                     | Any integer                                  | 19132            | Always                         |                                                                                                                                                                                                                                                                                                         |
| SERVER_PORTV6                   | Any integer                                  | 19133            | Always                         |                                                                                                                                                                                                                                                                                                         |
| LEVEL_NAME                      | Any string                                   | level            | Always                         | The name of level to be used/generated. Each level has its own folder in /worlds.                                                                                                                                                                                                                       |
| LEVEL_SEED                      | Any string                                   |                  | World creation                 | The seed to be used for randomizing the world. If left empty a seed will be chosen at random.                                                                                                                                                                                                           |
| ONLINE_MODE                     | true, false                                  | true             | Always                         | If true then all connected players must be authenticated to Xbox Live. Clients connecting to remote (non-LAN) servers will always require Xbox Live authentication regardless of this setting. If the server accepts connections from the Internet, then it's highly recommended to enable online-mode. |
| WHITE_LIST                      | true, false                                  | false            | Always                         | If true then all connected players must be listed in the separate whitelist.json file. See the Whitelist section.                                                                                                                                                                                       |
| ALLOW_CHEATS                    | true, false                                  | false            | Always                         |                                                                                                                                                                                                                                                                                                         |
| VIEW_DISTANCE                   | Any integer                                  | 10               | Always                         | The maximum allowed view distance. Higher values have performance impact.                                                                                                                                                                                                                               |
| PLAYER_IDLE_TIMEOUT             | Any integer                                  | 30               | Always                         | After a player has idled for this many minutes they will be kicked. If set to 0 then players can idle indefinitely.                                                                                                                                                                                     |
| MAX_THREADS                     | Any integer                                  | 8                | Always                         | Maximum number of threads the server will try to use.                                                                                                                                                                                                                                                   |
| TICK_DISTANCE                   | An integer in the range [4, 12]              | 4                | Always                         | The world will be ticked this many chunks away from any player. Higher values have performance impact.                                                                                                                                                                                                  |
| DEFAULT_PLAYER_PERMISSION_LEVEL | visitor, member, operator                    | member           | Always                         | Which permission level new players will have when they join for the first time.                                                                                                                                                                                                                         |
| TEXTUREPACK_REQUIRED            | true, false                                  | false            | Always                         | If the world uses any specific texture packs then this setting will force the client to use it.                                                                                                                                                                                                         |
| PERMISSIONSJSON                 | JSON                                         |                  | Always                         | See Notes Below                                                                                                                                                                                                                                                                                         |
| WHITELISTJSON                   | JSON                                         |                  | Always                         | See Notes Below                                                                                                                                                                                                                                                                                         |

## PERMISSIONSJSON
Set this if you want to add permissions to users.

| Key                | Type    | Value                                                                                                                                                                                                                                                                                                                 |
|--------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| permission               | String  | The permission level of the user. operator, member and visitor.                                                                                                                                                                                                                                                                                             |
| xuid               | String  |  The XUID of the user.                                                                                                                                                                                               |
### Example
```
[
    {
        "permission": "operator",
        "xuid": "451298348"
    },
    {
        "permission": "member",
        "xuid": "52819329"
    },
    {
        "permission": "visitor",
        "xuid": "234114123"
    }
]
```

## WHITELISTJSON
WHITE_LIST must be set to TRUE for this to work.

| Key                | Type    | Value                                                                                                                                                                                                                                                                                                                 |
|--------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name               | String  | The gamertag of the user.                                                                                                                                                                                                                                                                                             |
| xuid               | String  | Optional. The XUID of the user. If it's not set then it will be populated when someone with a matching name connects.                                                                                                                                                                                                 |
| ignoresPlayerLimit | Boolean | True if this user should not count towards the maximum player limit. Currently there's another soft limit of 30 (or 1 higher than the specified number of max players) connected players, even if players use this option. The intention for this is to have some players be able to join even if the server is full. |

### Example
```
[
    {
        "ignoresPlayerLimit": false,
        "name": "MyPlayer"
    },
    {
        "ignoresPlayerLimit": false,
        "name": "AnotherPlayer",
        "xuid": "274817248"
    }
]
```

## Installation
You can add more environment variables(env) not just limited to command envs below.
```
docker run --name bedrockengine -e SERVERNAME='My Server' \
-e GAMEMODE='creative' \
-e SERVER_PORT='19132' \
-p 19132:19132 \
electricreality/bedrockengine
```
OR clone this repository and build it yourself
### Persistent Data
To run the server with persistent data, use this command:
```
docker run --name bedrockengine -e SERVERNAME='My Server' \
-e GAMEMODE='creative' \
-e SERVER_PORT='19132' \
-p 19132:19132 \
-v BedrockEngine:/srv/bedrockserver/worlds
electricreality/bedrockengine
```
