#!/bin/bash

PROJECT="/mnt/Apps/My-Bin"
cd "$PROJECT" || exit
echo "Welcome to the administration block"
while true
    do
        echo "
            1.Summary of the block
            2.What are the new ideas
            3.To design
            4.To Push 
            5.Exit

        "
        echo "Enter the work need to grind : "
        read choice

        if [ "$choice" -eq 1 ]; then
            kate README.md
        elif [ "$choice" -eq 2 ]; then
            kate Things_to_build.txt
        elif [ "$choice" -eq 3 ]; then
            codium "$PROJECT"
        elif [ "$choice" -eq 4 ]; then
            source Git.sh
            git_push
        else 
            echo "Xiexie !!"
            break




        fi




    done