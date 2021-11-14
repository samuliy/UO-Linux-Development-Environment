#!/bin/bash

set -e

tmpfile=$(mktemp)

if [[ ! -f /ClassicUO/bin/Debug/settings.json ]]; then
	cat << SETTINGS > /ClassicUO/bin/Debug/settings.json
{
	"username" : "",
	"password" : "",
	"ip" : "",
	"port" : "",
	"ultimaonlinedirectory" : "",
	"profilespath" : "",
	"clientversion" : "",
	"lastcharactername" : "",
	"lang" : "",
	"lastservernum" : 1,
	"last_server_name" : "",
	"fps" : 60,
	"window_position" : null,
	"window_size" : null,
	"is_win_maximized" : true,
	"saveaccount" : false,
	"autologin" : false,
	"reconnect" : false,
	"reconnect_time" : 1,
	"login_music" : true,
	"login_music_volume" : 70,
	"shard_type" : 0,
	"fixed_time_step" : true,
	"run_mouse_in_separate_thread" : true,
	"force_driver" : 0,
	"use_verdata" : false,
	"maps_layouts" : null,
	"encryption" : 0,
	"plugins" : [
		"./Assistant/Razor.dll"
	]
}
SETTINGS
fi

jq ".ip = \"$UO_SERVER_HOST\" | .port = \"$UO_SERVER_PORT\" | .ultimaonlinedirectory = \"../UOData\"" < /ClassicUO/bin/Debug/settings.json > "$tmpfile"
cd /ClassicUO/bin/Debug
mv -f $tmpfile settings.json

if [[ -z "$WINE_RENDERER" ]]; then
	WINE_RENDERER=gdi
fi
winetricks renderer=$WINE_RENDERER

mkdir /home/uouser/classicuo
cd /home/uouser/classicuo
ln -s /UOData .
ln -s /ClassicUO/bin/Debug ClassicUO
cd ClassicUO

wine ClassicUO.exe
