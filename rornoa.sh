#!/bin/bash

ECHO "WELCOME TO MY TERMINAL"
source pqc.sh


while true
do
	echo "OKAERIII !!! SENCHOO \n\n\n"
	echo "1.All projects"
	echo "2.Projects track"
	echo "3.To create or search a Directory or file"
	echo "4.TO_DO List"
	echo "5.Update"
	echo "6.reboot"
    echo "The next arc is yours to decide : "
	read choice

	if [ "$choice" -eq 1 ]; then
		while true
		do
			echo "1.Git "
			echo "2.Intern"
			echo "3.AI Agents "
			echo "4.PQC"
			echo "5.Verilog"
			echo "6.RTPY"
			echo "7.Class hub"
			echo "8.Practice Problems"
			echo "9.Resume"
			echo "10.Vehicle design"
			echo "11.AI For Chip Design - BMS"
			echo "12.Exit"
		echo "Luckiest dynasty to enter : "
		read choice

		if [ "$choice" -eq 1 ]; then
			echo "
			1.Git - repo creation
			2.Git daily push
			3.Git cloning projects
			4.Git pulling the latest
			5.Want to check commits  
			6.Exit
			"
			echo "What are you going to do : "
			read choice 
			if [ "$choice" -eq 1 ]; then
				source Git.sh
				git_repo_creation

			elif [ "$choice" -eq 2 ]; then
				source Git.sh
				git_push
			elif [ "$choice" -eq 3 ]; then
				source Git.sh
				git_clone
			elif [ "$choice" -eq 4 ]; then
				source Git.sh
				git_pull
			elif [ "$choice" -eq 5 ];then
				source Git.sh
				git log
			
			elif [ "$choice" -eq 6 ];then 
				break
			

			else 
				echo "Wrong call try again\n\n"
			

			fi
		


		elif [ "$choice" -eq 2 ]; then
			echo "\n\nGenkai wo koeraaaa \n\n\n"

			while true
			do

				echo "1.Diveeee  "
				echo "2.Track  "
				echo "3.Exit"
 			echo "Want to play or just rest : "
			read choice

			if [ "$choice" -eq 1 ]; then

				echo "Hearrr meee Roarrrr !!"

				file="/mnt/Apps/Project_bin/intern/INTERN-ME-command-center-day-reset.html"
				cat "$file"

			elif [ "$choice" -eq 2 ]; then

				echo "Yukkuri 😌🍃"

			elif [ "$choice" -eq 3 ]; then
				break
			fi
        done

		elif [ "$choice" -eq 3 ] ; then
        
			echo "\n\n🛡️ Agents online. "
			echo "Agents starting "
			echo "⚡ Welcome back, Commander."
			echo "Files are loading \n\n"
			echo "Sucessfully loaded "

			source ai_agent.sh
			ai_files		
		
		
		elif [ "$choice" -eq 4 ]; then
        while true
        do
			echo "\n\n\n BANKAI \\n\n"


			echo "The relam waits... "
			echo "Preparing the Grand Line Routesss..."
			echo "The North Remembers "
			echo "Team Assembled... "
			echo "Workspace initialized "




			echo "Enter the ship to be sailedd : "

			read choice

			echo "1.PYQ"
			echo "2.Files "

			if [ "$choice" -eq 1 ]; then

				echo "Match day approaches "
				echo "Preparing Today's Session "

				echo "Enter the ship to be sailed : "
                read choice

				echo "1.PQC ARCH 1 "
				echo "2.PQC ARCH 2 "
				echo "3.PQC ARCH 3"
				echo "4.Pqc-snn-chip-complete "
				echo "5.Kyber-deploy "
				echo "7.Exit"
				
					if [ "$choice" -eq 1 ]; then

						echo "Knowledge acquisition in progress... "
						echo "Research protocol initiated..."
						echo "Loading experiments..."
						source pqc.sh
						
						pqc_arch1   #function call only opens the files and github
						


						

					elif [ "$choice" -eq 2 ]; then

						pqc_arch2

					elif [ "$choice" -eq 3 ]; then
						pqc_arch3

					elif [ "$choice" -eq 4 ];then

						pqc_snn

					elif [ "$choice" -eq 5 ];then

						pqc_kyber_deploy
					
					elif [ "$choice" -eq 6 ];then

						#dolphin "/mnt/Apps/Project_bin/buisness-startup/PYQ/Code/sri-hari/"
						echo "Just working"
					elif [ "$choice" -eq 7 ];then

						echo "Startup over !! Work every waking hours !!"
						break
					else 
						echo "Try again stronger "

					
					fi
			elif [ "$choice" -eq 2 ]; then
				echo "Rendering architecture..."
				echo "Opening architectural framework..."
				echo "The next evolution takes shape."

				echo "Enter your choice "
				read choice

				echo "1.Arch 1"
				echo "2.Arch 2"
				echo "3.Arch 3"
				echo "4.Overall generals "
				echo "5.Fund rise "
				echo "6.Exit"

				if [ "$choice" -eq 1 ]; then
					dolphin "/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/Arch -1/"
					tree "/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/Arch -1/"
				elif [ "$choice" -eq 2 ]; then
					dolphin "/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/Arch -2/"
					tree "/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/Arch -2/"
				elif [ "$choice" -eq 3 ]; then
					dolphin "/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/Arch -3/"
					tree "/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/Arch -3/"

				elif [ "$choice" -eq 4 ]; then
					folder="/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/on code/"
					dolphin "$folder" &
					dolphin_pid=$!
					read
					kill "$dolphin_pid"
				elif [ "$choice" -eq 5 ]; then
					folder="/mnt/Apps/Project_bin/buisness-startup/PYQ/Research/fund rise/"
					dolphin "$folder" &
					dolphin_pid=$!
					read
					kill "$dolphin_pid"
				elif [ "$choice" -eq  6 ]; then
					break
				else 
					echo "Try again"
				fi   #fi for files
			fi  # fi for business startup

        
		done  #closing business loop
		elif [ "$choice" -eq 5 ]; then 
			source verilog.sh
		elif [ "$choice" -eq 6 ]; then
			source rtpy.sh
			go_to_path
		elif [ "$choice" -eq 7 ]; then
			source class_hub.sh
		elif [ "$choice" -eq 8 ]; then
			echo "Welcome to practice battlefield "
			source pp.sh
		elif [ "$shcoice" -eq 11 ]; then
			source ai_chip.sh
		elif [ "$choice" -eq 12 ]; then
			break
		fi

	done       
	elif [ "$choice" -eq 2 ]; then

		echo "Project Tracked "

	elif [ "$choice" -eq 3 ]; then
		source dir.sh
		while true
		do
		echo "1.To create a folder "
		echo "2.To find the folder "
		
		echo "3.Exit"

		echo "\n\nEnter the option : "
		read choice 
		

		if [ "$choice" -eq 1 ]; then
			create_dir
		elif [ "$choice" -eq 2 ]; then
			go_to_dir
		elif [ "$choice" -eq 3 ]; then
			echo "Done !! \n\n"
			break


		fi
		done
	elif [ "$choice" -eq 4 ]; then
		python3 to_do.py
	elif [ "$choice" -eq 5 ]; then

		sudo zypper clean  --all && sudo zypper ref -fsb && sudo zypper dup -l --allow-vendor-change

	elif [ "$choice" -eq 6 ]; then

		sudo reboot
	

	else
		echo "Mission completed "
		break
    
    fi

done

