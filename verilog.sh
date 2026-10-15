while true
			do 
			echo "
				1.Modelsim
				2.Quartus
				3.Xilinx
				4.Project files
				5.Verilog quick test
				6.Exit
			
			
			"
			echo "Enter your choice : "
			read choice 
			
			if [ "$choice" -eq 1 ];then
				vsim -gui &

            elif [ "$choice" -eq 2 ];then
				quartus/bin/quartus &
            elif [ "$choice" -eq 3 ];then
				echo "Xilinx is not available "
            elif [ "$choice" -eq 4 ];then
				dolphin "/mnt/Apps/Project_bin/VERILOG/" &
			elif [ "$choice" -eq 5 ]; then
				cd /mnt/Apps/Project_bin/VERILOG/
				echo "Welcome to Verilog automatic simulation"

				FILE="session.sv"

				echo "Write your code below (EOF to end) : "
				: > "$FILE"
				
				while IFS= read -r line;
				do
					[[ "$line" == "EOF" ]] && break
					printf '%s\n' "$line" >> "$FILE"
				done

				echo "Your design is saved"
				if iverilog -g2012 -o sim session.sv; then
					echo "Compilaion successful"
					if vvp sim ; then
						sleep 2
						echo "Simulation successful"
					else
						echo "Simulation Failed"
					fi
				else 
					echo "Compilation failed"
				
				fi
				: > "$FILE"
            else 
                break
            fi
    done