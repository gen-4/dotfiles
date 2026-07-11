#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ICON='󰖟'
RED_CLASS='failure'
GREEN_CLASS='success'
YELLOW_CLASS='warning'

successes=0
failures=0

tooltip="APPS"

file=$1
if [[ ! -f "$file" ]]; then
    echo "File not found or not specified."
    exit 1
fi

while IFS= read -r line || [[ -n $line ]]; do
    failures=$((failures + 1))
    color=$RED
    displayIcon='⭕'
    curl_output=$(curl -s --max-time 20 --write-out "%{http_code}" "$line" 2>&1)
    status=$(echo "$curl_output" | tail -n 1)
    if [[ $status -ge 200 && $status -lt 300 ]]; then
        color=$GREEN
        failures=$((failures - 1))
        successes=$((successes + 1))
        displayIcon='✅'
    fi

    # echo -e "App: $line | Healthcheck: $color$displayIcon$NC"
    notify-send "App: $line | Healthcheck: $displayIcon"
    tooltip=$(echo "$tooltip \rApp: $line | Healthcheck: $displayIcon")

done < "$file"

status_color=$YELLOW_CLASS
if [ "$failures" -eq 0 ]; then
    status_color=$GREEN_CLASS

elif [ "$successes" -eq 0 ]; then
    status_color=$RED_CLASS
fi

printf '{"text": "%s", "alt": "", "tooltip": "%s", "class": "%s"}' "$ICON" "$tooltip" "$status_color"
