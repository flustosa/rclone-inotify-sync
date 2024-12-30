#!/bin/bash

# Configuration file
CONFIG_FILE="/etc/rclone-sync/sync.conf"
RCLONE_CONFIG="/root/.config/rclone/rclone.conf" 


# Read the configuration file
while IFS=' ' read -r local_dir remote_dir; do
	[[ "$local_dir" =~ ^#.*$ ]] && continue
    # Ignore lines starting with '#' or that are empty
    [ -z "$local_dir" ] && continue

    # Monitor each directory listed in the configuration file
    /usr/bin/inotifywait -m -r -e modify,create,delete,move "$local_dir" |
    while read -r directory events filename; do
		/usr/bin/rclone sync -v --config "$RCLONE_CONFIG" "$local_dir" "$remote_dir" --syslog ## Loglevel: default (Error, Notice); -q (E); -v (E, N, I), -vv (E, N, I, D)
    done &
done < "$CONFIG_FILE"

wait

