#!/bin/bash

PROJECT="/mnt/Apps/Project_bin/Practice_Problems/"
cd "$PROJECT" || exit
while true
	do

	echo "
    1.Generate New questions
    2.To solve the problems
    3.To compile all at once 
    4.GIt push
    5.Exit
	"
    echo "Enter what mission need to accomplish : "
    read choice

    if [ "$choice" -eq 1 ]; then
        echo "The questions are going to generate "
        sleep 3
        chromium "https://claude.ai/chat/df2a4eee-d6f9-4121-91fb-4a8b7d4ad7eb"
    elif [ "$choice" -eq 2 ]; then
        echo "Shifting to the space codium"
        sleep 3
        codium "$PROJECT"
    elif [ "$choice" -eq 3 ]; then
        while true 
            do
                echo "
                    1.C programming
                    2.Python programming
                    3.SystemVerilog
                    4.Exit
                "
                echo "Enter which dynasty to conquer : "
                read subchoice 
                
                if [ "$subchoice" -eq 1 ];then
                        cd "$PROJECT/C" || continue
                        gcc "$(ls -t *.c | head -n 1)" -o main #Last modified sorted according to the time
                        ./main
                        cd "$PROJECT"
                        echo "Done"
                elif [ "$subchoice" -eq 2 ];then
                        cd "$PROJECT/Python" || continue
                        python3 "$(ls -t *.py | head -n 1)"
                        cd "$PROJECT"
                        echo "Done"
                elif [ "$subchoice" -eq 3 ];then
                        cd "$PROJECT/SystemVerilog" || continue
                        cd ./"$(ls -td | head -n 1)"
                        ls
                        echo "Name the top module and testbench to simulate (one by one) : "
                        read veri
                        sleep 2
                        read tb

                        iverilog -g2012 -o sim "$veri" "$tb"
                        vvp sim

                        cd "$PROJECT"
                        echo "Done"
                elif [ "$choice" -eq 4 ];then
                    echo "All the files are simulated and verified gracefully"
                    break
                
                else 
                    echo "Enter a valid input"
                
                fi

            done
    elif [ "$choice" -eq 4 ]; then
        cd "$PROJECT" || exit
        source Git.sh
        git_push
    elif [ "$choice" -eq 5 ]; then
        break


    fi



    done