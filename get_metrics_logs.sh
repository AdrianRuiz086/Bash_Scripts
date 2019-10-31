#!/bin/bash
#Purpose = Filter Host Metrics
#Created on 2019-10-02
#Author = Edgar Adrian Sanchez Ruiz
#Version 1.0
#START
dir=./Metrics
if [ -d "$dir" ]; then 
echo " "
echo "The Directory Metrics exists"
echo " "
else 
echo " "
echo "###### Creating the directory Metrics ######"
mkdir ./Metrics
echo " "
fi
for i in {1..10}
do 
host=0
type=0
blaze=0
echo "###### Select the host of which you want to search ######"
echo " "
echo "	1) m19na2devbmapp001.bio-sjc.ea.com"
echo "	2) m19na2devbmapp002.bio-sjc.ea.com"
echo "	3) m19na2devbmapp003.bio-sjc.ea.com"
echo "	4) All of the hosts"
echo "	5) Exit"
echo " "
read host
echo " "
if [ $host != 1 ] && [ $host != 2 ] && [ $host != 3 ] && [ $host != 4 ] && [ $host != 5 ] ; then 
	echo "You have selected an incorrect option."
	echo " "
else
if [ $host -ne 5 ]; then 
echo "###### Select the type of metric that you looking for ######"
echo " "
echo "	1) Full metrics (Hardware + Blaze metrics)"
echo "	2) Hardware metrics"
echo "	3) Blaze metrics"
echo " 	4) All of the metrics" 
echo " 	5) Return to the main menu"
echo " "
read type
echo " "
else 
type=0
fi

if [ $type -eq 3 ];  then 
echo "###### Do you like to add a filter to blaze metrics? ######"
echo " "
echo "	1) Connectionmanager"
echo "	2) Databases"
echo "	3) Dbqueries"
echo "	4) Endpointdrainstatus"
echo "	5) External"
echo "	6) Httpsvc"
echo "	7) Internal"
echo "	8) Logger"
echo "	9) Redis"
echo "	10) RPC"
echo "	11) Selector"
echo "	12) Status"
echo "	13) Utilization"
echo "	14) Blaze utilization config uptime"
echo "	15) Do not filter Blaze metrics"
echo "	16) Return to the main menu"
echo " "
read blaze
#echo " "
#echo "###### Generating the logs... ######"
#sleep 5
echo " "
fi

case $host in
	1) 
	#echo "m19na2devbmapp001.bio-sjc.ea.com" 
	dev001="m19na2devbmapp001.bio-sjc.ea.com"
	for i in $(cat blaze_metrics.txt)
		do
			if [ $type -eq 1 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt
			else
			if [ $type -eq 2 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt
			else
			if [ $type -eq 3 ]; then 
			
			case $blaze in
				1) echo "connectionmanager"
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"				
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_connectionmanager* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				2) echo "databases" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_databases* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				3) echo "dbqueries" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_dbqueries* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				4) echo "endpointdrainstatus" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_endpointdrainstatus* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				5) echo "external" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_external* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				6) echo "httpsvc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_httpsvc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				7) echo "internal" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_internal* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				8) echo "logger" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_logger* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				9) echo "redis" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_redis* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				10) echo "rpc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_rpc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				11) echo "selector" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_selector* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				12) echo "status" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_status* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				13) echo "utilization" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_utilization* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				14) echo "Blaze utilization config uptime" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt
				;;
				15) echo "Do not filter Blaze metrics" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				;;
				16) echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0			
				;;
				*) flag1=0	
				;;
				esac
				
			else
			
			if [ $type -eq 4 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
			    echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
			else 
			if [ $type -eq 5 ]; then 
				echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0
			else 			
			flag1=0			
			fi
			fi
			fi
			fi
			fi
					
		done
		if [ $flag1 -eq 0 ]; then
		echo "You have selected an incorrect option."
		echo " "
	fi
	;;
	2) 
	#echo "m19na2devbmapp002.bio-sjc.ea.com" 
	dev002="m19na2devbmapp002.bio-sjc.ea.com"
	for i in $(cat blaze_metrics.txt)
		do
			if [ $type -eq 1 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt
			else
			if [ $type -eq 2 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt
			else
			if [ $type -eq 3 ]; then 
				
			case $blaze in
				1) echo "connectionmanager"
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"				
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_connectionmanager* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				2) echo "databases" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_databases* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				3) echo "dbqueries" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_dbqueries* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				4) echo "endpointdrainstatus" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_endpointdrainstatus* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				5) echo "external" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_external* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				6) echo "httpsvc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_httpsvc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				7) echo "internal" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_internal* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				8) echo "logger" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_logger* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				9) echo "redis" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_redis* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				10) echo "rpc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_rpc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				11) echo "selector" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_selector* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				12) echo "status" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_status* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				13) echo "utilization" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_utilization* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				14) echo "Blaze utilization config uptime" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt
				;;
				15) echo "Do not filter Blaze metrics" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				;;
				16) echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0			
				;;
				*) flag2=0
				;;
				esac
				
			else
			
			if [ $type -eq 4 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
			    echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
			else 
			if [ $type -eq 5 ]; then 
				echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0
			else 			
			flag2=0			
			fi
			fi
			fi
			fi
			fi
			
		done	
	if [ $flag2 -eq 0 ]; then
		echo "You have selected an incorrect option."
		echo " "
	fi
	;;
	3) 
	#echo "m19na2devbmapp003.bio-sjc.ea.com"
	dev003="m19na2devbmapp003.bio-sjc.ea.com"
	for i in $(cat blaze_metrics.txt)
		do
			if [ $type -eq 1 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt
			else
			if [ $type -eq 2 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt
			else
			if [ $type -eq 3 ]; then 
			
				case $blaze in
				1) echo "connectionmanager"
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"				
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_connectionmanager* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				2) echo "databases" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_databases* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				3) echo "dbqueries" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_dbqueries* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				4) echo "endpointdrainstatus" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_endpointdrainstatus* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				5) echo "external" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_external* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				6) echo "httpsvc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_httpsvc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				7) echo "internal" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_internal* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				8) echo "logger" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_logger* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				9) echo "redis" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_redis* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				10) echo "rpc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_rpc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				11) echo "selector" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_selector* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				12) echo "status" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_status* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				13) echo "utilization" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_utilization* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				14) echo "Blaze utilization config uptime" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt
				;;
				15) echo "Do not filter Blaze metrics" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				16) echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0			
				;;
				*) flag3=0
			;;
				esac
				
			else
			
			if [ $type -eq 4 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
			    echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
			else 
			if [ $type -eq 5 ]; then 
				echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0
			else 			
			flag3=0			
			fi
			fi
			fi
			fi
			fi
			
		done
	if [ $flag3 -eq 0 ]; then
		echo "You have selected an incorrect option."
		echo " "
	fi
	;;
	4) 
	#echo "All of the hosts" 
	dev001="m19na2devbmapp001.bio-sjc.ea.com"
	dev002="m19na2devbmapp002.bio-sjc.ea.com"
	dev003="m19na2devbmapp003.bio-sjc.ea.com"
	
	for i in $(cat blaze_metrics.txt)
		do
			if [ $type -eq 1 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt
			else
			if [ $type -eq 2 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt
			else
			if [ $type -eq 3 ]; then 
				
				case $blaze in
				1) echo "connectionmanager"
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"				
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_connectionmanager* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_connectionmanager* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_connectionmanager* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				2) echo "databases" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_databases* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_databases* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_databases* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				3) echo "dbqueries" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_dbqueries* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_dbqueries* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_dbqueries* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				4) echo "endpointdrainstatus" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_endpointdrainstatus* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_endpointdrainstatus* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_endpointdrainstatus* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				5) echo "external" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_external* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_external* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_external* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				6) echo "httpsvc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_httpsvc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_httpsvc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_httpsvc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				7) echo "internal" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_internal* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_internal* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_internal* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				8) echo "logger" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_logger* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_logger* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_logger* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				9) echo "redis" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_redis* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_redis* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_redis* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				10) echo "rpc" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_rpc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_rpc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_rpc* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				11) echo "selector" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_selector* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_selector* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_selector* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				12) echo "status" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_status* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_status* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_status* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				13) echo "utilization" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_utilization* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_utilization* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep blaze_utilization* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				14) echo "Blaze utilization config uptime" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt				
				;;
				15) echo "Do not filter Blaze metrics" 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				;;
				16) echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0			
				;;
				*) flag4=0
				;;
				esac
				
			else
			
			if [ $type -eq 4 ]; then 
				port1="$(echo $i | sed 's/^.\{40\}//' | sed 's/.\{8\}$//')"
			    echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' >> ./Metrics/$(date +%F)_full_metrics_m19na2devbmapp003_dev.txt
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep -v ^blaze_* >> ./Metrics/$(date +%F)_hardware_metrics_m19na2devbmapp003_dev.txt
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* >> ./Metrics/$(date +%F)_blaze_metrics_m19na2devbmapp003_dev.txt
				echo -e "\n ###### Host: $dev001    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp001_dev.txt
				echo -e "\n ###### Host: $dev002    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp002_dev.txt
				echo -e "\n ###### Host: $dev003    Port: $port1 ###### \n" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt && curl $i | sed '/^#/ d' | grep ^blaze_* | grep -i "blaze_utilization_config_uptime" >> ./Metrics/$(date +%F)_blaze_utilization_config_uptime_m19na2devbmapp003_dev.txt
			else 
			if [ $type -eq 5 ]; then 
				echo "Returning to the main menu"
				echo " "
				sleep 3
				host=0
				type=0
			else 			
			flag4=0			
			fi
			fi
			fi
			fi
			fi
			
		done
	if [ $flag4 -eq 0 ]; then
		echo "You have selected an incorrect option."
		echo " "
	fi
	;;
	5)
	echo "Bye!"
	echo " "
	sleep 2
	exit
	;;
	
		*) #echo "INVALID NUMBER!" ;;
esac
echo " "
fi
done
#END

