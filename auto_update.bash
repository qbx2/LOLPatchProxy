#!/bin/bash
last_patch=`cat last_patch.txt 2>/dev/null`
curl --silent http://www.leagueoflegends.co.kr/\?m\=news\&cate\=update 2>&1 | grep "[0-9]\+\.[0-9]\+.*패치 노트" | sed -n "s/.*\([0-9]\+\.[0-9]\+.*패치 노트\).*/\1/p" | head -n1 > last_patch.txt
diff --brief <(echo $last_patch) last_patch.txt > /dev/null
if [ $? -eq 1 ]
then
    date
    echo "updating version information ..."
    ./2_download_versions.sh
#else
    #echo "version information is latest"
fi
