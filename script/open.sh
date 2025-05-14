#! /bin/sh
SCRIPT_DIR=#(dirname $(readlink -f $0))
source $SCRIPT_DIR/.env
if [ -z "$ZOOM_ID_REPO" ] || [ -z "$ZOOM_PWD_REPO" ] || [ -z "$ZOOM_ID_MTG" ] || [ -z "$ZOOM_PWD_MTG" ]; then
    echo "⚠️Error: Zoom meetingのIDとPASSWORDを環境変数に設定してください" >&2
    exit 1
fi
if [ "$1" = "repo" ]; then
    id=$ZOOM_ID_REPO
    pwd=$ZOOM_PWD_REPO
elif [ "$1" = "mtg" ]; then
    id=$ZOOM_ID_MTG
    pwd=$ZOOM_PWD_MTG
else 
    echo "⚠️Error: 第一引数は \"repo\" or \"mtg\"を指定してください" >&2
    exit 1
fi

open "zoommtg://zoom.us/join?confno=$id&pwd=$pwd"
