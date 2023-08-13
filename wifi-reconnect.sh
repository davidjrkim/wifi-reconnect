#!/bin/bash

LOG_PATH="/home/david/wifi-reconnect/wifi-log.txt"
INTERFACE="wlan0"

SSID=$(/usr/sbin/iwgetid --raw)

if [ -z "$SSID" ]; then
    echo "$(date -Is) WiFi interface is down, trying to reconnect" >> "$LOG_PATH"
    sudo ip link set "$INTERFACE" down
    sleep 30
    sudo ip link set "$INTERFACE" up
fi

echo "WiFi check finished"
