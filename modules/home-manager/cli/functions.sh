
function weather() {
    curl wttr.in/$1
}

function service() {
    if [[ -z "$1" ]]; then
        echo "no command provided from [stop, start, restart]"
        return 1
    fi
    if [[ -z "$2" ]]; then
        echo "No service name provided"
        return 1
    fi

    service=$(launchctl list | awk "/$2/ {print $NF}")
    if [[ "$1" == "restart" ]]; then
        launchctl stop $service && launchctl start $service
    else
        launchctl $1 $service
    fi
}

