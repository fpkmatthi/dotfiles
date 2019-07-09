#!/bin/dash

### TODO: add options like --switch to switch state and --show to show state
usage()
{
    echo "if this was a real script you would see something useful here"
    echo ""
    echo "./simple_args_parsing.sh"
    echo "-h --help"
    echo "--environment=$ENVIRONMENT"
    echo "--db-path=$DB_PATH"
    echo ""
}

main() {
    STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

    if [ "$STATUS" = "Connected" ]; then
	if [ "$1" = "switch" ]; then
            nordvpn disconnect > /dev/null 2>&1 && echo "%{F#f54242}ﱾ%{F-}" 
        else
	    echo "%{F#60f542}ﱾ $(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2)%{F-}"
	fi
    else
	if [ "$1" = "switch" ]; then
            nordvpn connect > /dev/null 2>&1 && echo "%{F#60f542}ﱾ $(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2)%{F-}"
        else
	    echo "%{F#f54242}ﱾ%{F-}"
	fi
        
    fi
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --status)
            main 
            ;;
        --switch)
            main switch
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done


