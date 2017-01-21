FROM ubuntu:latest
MAINTAINER Eric Keller <keller dot eric at gmail dot com>

RUN apt update -y
RUN apt-get dist-upgrade -y
RUN apt install -y lib32gcc1 lib32stdc++6 curl

ENV USER steam

RUN useradd -m $USER
USER $USER
WORKDIR /home/$USER
ADD ./csgo.sh csgo.sh
ADD ./csgo_ds.txt csgo_ds.txt
RUN curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -
RUN ./steamcmd.sh +login anonymous +force_install_dir ./csgo_ds +app_update 740 +quit
# fixes pushd/popd warnings
RUN sed -i 's#[!]/bin/sh#!/bin/bash#g' csgo_ds/srcds_run
# fixes missing library
RUN mkdir -p ~/.steam/sdk32
RUN ln -s ~/linux32/steamclient.so ~/.steam/sdk32/steamclient.so
EXPOSE 27015/udp
ENTRYPOINT ["./csgo.sh"]
CMD ["+game_type" "0" "+game_mode" "0" "+mapgroup" "mg_bomb" "+map" "de_dust2"]
