#!/bin/bash

PROJECT="/mnt/Apps/My-Bin"

while true 
    do  

    echo "
            1.To open file
            2.To run simulation
            3.To see the report 
            4.File structure 
            5.Push in Git
            6.Exit
        "

        echo "Enter what to do : " 
        read choice

        if [ "$choice" -eq 1 ]; then
            codium "$PROJECT"
        elif [ "$choice" -eq 2 ]; then
            cd "$PROJECT" || continue
            MPLBACKEND=QtAgg python drive_simulator.py 2>/dev/null 
        elif [ "$choice" -eq 3 ]; then
            cd "$PROJECT/output/reports"
            xdg-open "$(ls -t *.txt | head -n 1)"
        elif [ "$choice" -eq 4 ]; then
            cd "$PROJECT"
            tree
        elif [ "$choice" -eq 5 ]; then 
            cd "$PROJECT" || exit
            source Git.sh
            git_push
        elif [ "$choice" -eq 6 ]; then
            break
        else 
            echo "Choose a valid operation !"
        fi
    done