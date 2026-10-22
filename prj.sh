#!/bin/bash

PROJECT="/mnt/Apps/Project_bin/PROJECT 5678910/"


while true
    do 

    echo "
        1.List the Projects
        2.Open the Projects
        3.Exit
    "
    echo "Enter the mission to take over : "
    read choice 

    if [ "$choice" -eq 1 ]; then
        cd "$PROJECT/tracecore"
        ls -l
    elif [ "$choice" -eq 2 ]; then
        source "/mnt/Apps/My-Bin/timer.sh"
        start_timer "tracecore"
        codium --wait --new-window "$PROJECT/tracecore" 
        stop_timer
    elif [ "$choice" -eq 3 ]; then 
        echo "Machine take care"
        break
    else 
        echo "Invalid choice"


    fi  
    done
    #In process