#!/bin/sh
cd /home/steam/csgo_ds
./srcds_run -game csgo -autoupdate -steam_dir ~/ -steamcmd_script ~/csgo_ds.txt $@
