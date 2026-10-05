#!/bin/bash

while true
do
    if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1
    then
        echo "Internet connected — fixing time..."

        sudo chronyc makestep
        sudo hwclock --systohc

        echo "Time: $(date)"

        sleep 60
    else
        sleep 10
    fi
done
