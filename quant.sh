#!/bin/bash

PROJECT="/mnt/Apps/Project_bin/Quantum_Designs"
cd "$PROJECT" || exit


while true
    do

        echo "
                1.Generate the session material 
                2.See the Designs already created 
                3.Open the designs to work
                4.Exit
        "
        echo "Enter your choice : "
        read choice

        if [ "$choice" -eq 1 ]; then
            firefox https://claude.ai/chat/a4d8b0c5-9d31-46f2-8c20-a79302f7f84f
        elif [ "$choice" -eq 2 ]; then
            tree
        elif [ "$choice" -eq 3 ]; then
            codium "$PROJECT"
        elif [ "$choice" -eq 4 ]; then
            break
        else 
            echo "Enter a valid choice"

        fi


    done