#!/usr/bin/env bash

jq -c '.[]' "$1/settings.json" | while read -r step; do
    ACTION=$(echo "$step" | jq -r '.action')
    PARAMS=$(echo "$step" | jq -c '.params')

    SCRIPT="$PWD/$ACTION.sh"

    bash "$SCRIPT" "$1" "$PARAMS"
done
