#!/bin/bash

DATA_FILE=/tmp/network_utilization

NEW=$(grep venet0 /proc/net/dev | cut -c9- | awk '{ print $1 " " $9 }')
TIME=$(date +%s)

if [ ! -f "$DATA_FILE" ]
then
    touch "$DATA_FILE"
    chmod 664 "$DATA_FILE"
    echo "$TIME $NEW" > "$DATA_FILE"
    exit 0
fi

OLD=$(tail -n 1 /tmp/network_utilization)

echo -e "$OLD\n$TIME $NEW" > "$DATA_FILE"

exit 0
