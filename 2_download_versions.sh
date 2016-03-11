#!/bin/sh

#  2_download_versions.sh
#  LoLOC1
#
#  Created by Jason Koo on 4/9/15.
#  Copyright (c) 2015 Jaesung Koo. All rights reserved.
#
#  $> ./2_download_versions.sh

# check folder structures

if [ ! -d "/releases/Maclive" ]; then
    mkdir -p releases/Maclive && cd releases/Maclive
    mkdir -p projects/lol_air_client/releases
    mkdir -p projects/lol_air_client_config_oc1/releases
    mkdir -p projects/lol_launcher/releases
    mkdir -p projects/lol_patcher/releases
    mkdir -p solutions/lol_game_client_sln/releases
    mkdir -p system
fi

# download files
BASE_URL="http://l3cdn.riotgames.com/releases/Maclive"
curl -o solutions/lol_game_client_sln/releases/releaselisting_OC1 $BASE_URL/solutions/lol_game_client_sln/releases/releaselisting_OC1
curl -o projects/lol_air_client/releases/releaselisting_OC1 $BASE_URL/projects/lol_air_client/releases/releaselisting_OC1
curl -o projects/lol_air_client_config_oc1/releases/releaselisting_OC1 $BASE_URL/projects/lol_air_client_config_oc1/releases/releaselisting_OC1
curl -o projects/lol_launcher/releases/releaselisting_OC1 $BASE_URL/projects/lol_launcher/releases/releaselisting_OC1
curl -o projects/lol_patcher/releases/releaselisting_OC1 $BASE_URL/projects/lol_patcher/releases/releaselisting_OC1
curl -o system/filelist.versioninfo $BASE_URL/system/filelist.versioninfo
