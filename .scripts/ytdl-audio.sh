#!/bin/dash

# use %(title) instead of songname
#songname=$1
link=$1

### TODO: add song to old-data.txt and check if song is already present on download 
usage()
{
    #echo "Usage: ytdl-audio.sh <name> <link>"
    echo "Usage: ytdl-audio.sh <link>"
}

main() {
    #youtube-dl -o "$HOME/Music/$songname.%(ext)s" --extract-audio --audio-format mp3 $link
    youtube-dl -o "$HOME/Downloads/ytdl-music/%(title)s.%(ext)s" --extract-audio --audio-format mp3 $link
}

if [ $# -eq 0 ] || [ $# -gt 2 ]; then
    usage
    exit 1
fi

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        -*)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

main
