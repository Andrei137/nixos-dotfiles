#!/usr/bin/env bash

echo "Symlink stage"
echo "-------------"

echo "$2" | jq -c '.[]' | while read -r param; do
    SRC=$(echo "$param" | jq -r '.source')
    DST=$(echo "$param" | jq -r '.destination')
    DST=$(eval echo "$DST")

    FULL_SRC="$1/$SRC"

    mkdir -p "$(dirname "$DST")"

    if [[ ! -e "$DST" ]]; then
        ln -s "$FULL_SRC" "$DST"
        echo "Symlink created: $DST -> $FULL_SRC"
    else
        echo "Warning: $DST already exists"
    fi
done
