#!/bin/bash
# 
#
# CleanMemory.sh 
#
# Version 1.0
# Creation Date - 16/02/2016
# License: GPL
# Script to synchronize information between HD and
# Memory and after timing releases the use of memory using cron.
#
# Author: Luis Paulo Almeida
# Email: lpgpalmeida@gmail.com
#
# To run the script just set the execute permissions:
# Chmod +x CleanMemory.sh or chmod 711 CleanMemory.sh
# But you have to be to run the system root and
# If you want to use the script in any directory for copying:
# /usr/bin with the proper execute permissions.
#
#  
# 
#
# Enter comment below with changes / corrections / improvements to the script

# Check whether the root to run the script
if [ "$(id -u)" = "0" ]		
		then

		# Sets maximum size to request cleaning in memory
		MemSet=2500

		# Returns information direct memory used

		MemUsed=$(free -m -t | grep Mem: | cut -c37-40)
			if test "$MemUsed" -gt <= "$MemSet"
				then
					# Command to synchronize memory data with HD, 
					# if not used the sync is possible loss of memory data to HD
					sync
					
					# Area of memory being cleaned					
					echo 3 > /proc/sys/vm/drop_caches
			fi
		else
			echo Please dear user log in as root or sudo command
fi
