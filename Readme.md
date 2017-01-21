# Yet another CSGO dedicated server, docker container

I got inspired from https://github.com/Gonzih/docker-csgo-server, but fixed the ubuntu version to latest, among others
Useful additional information can also be found at: https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD


## Building the server image

```
docker build -t csgods .
```

## Running a dedicated server with the default CMD from the Dockerfile

```
docker run -d -p 27015:27015/udp csgo
```

## Customize the csgo server

```
docker run -d -p 27015:27015/udp csgo +game_type 0 +game_mode 0 +mapgroup mg_bomb +map de_dust2
```

Enjoy!
