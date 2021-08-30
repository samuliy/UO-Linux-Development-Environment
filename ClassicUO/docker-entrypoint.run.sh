#!/bin/bash

set -e

tmpfile=$(mktemp)

jq ".ip = \"$UO_SERVER_HOST\" | .port = \"$UO_SERVER_PORT\" | .ultimaonlinedirectory = \"../UOData\"" < /ClassicUO/bin/Debug/settings.json > "$tmpfile"
cd /ClassicUO/bin/Debug
mv -f $tmpfile settings.json

winetricks renderer=gdi

mkdir /home/uouser/classicuo
cd /home/uouser/classicuo
ln -s /UOData .
ln -s /ClassicUO/bin/Debug ClassicUO
cd ClassicUO

wine ClassicUO.exe
