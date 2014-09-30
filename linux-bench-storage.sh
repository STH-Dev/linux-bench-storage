#!/bin/bash
#	
#	Linux-Bench Storage Benchmark Script
#	(C) 2013-2014 ServeTheHome.com and ServeThe.biz
#
# 	Linux-Bench - A System benchmark and comparison tool created by the STH community.
#
#	Linux-Bench is a sscript that runs fio
#	
#	Linux-Bench must be run as root or using a su prompt to automate download and installation of benchmarks
#
#	For more information go:
#	http://www.linux-bench.com
#
# 	Authors: Patrick Kennedy, Patriot
#
#	Latest development versions are available on the GitHub site:  https://github.com/STH-Dev/linux-bench-storage/
#
#   	If you find bugs, verify you are on the latest version and then post in:
#	https://forums.servethehome.com/index.php?threads/linux-bench-storage.3916/
#
################################################################################################################################

#Current Version
rev='s0001'

version()
{
cat << EOF
##############################################################
#  (c) 2014 ServeTheHome.com and ServeThe.biz
# 
#	Linux-Bench $rev
#	- Linux-Bench Storage the STH Storage Benchmark Suite 
###############################################################

EOF
}

usage() 
{
cat << EOF

usage: $0 

This is the STH benchmark suite. 

ARGS:
        ARG1 - none required for now
        ARG2 - none required for now
        ARG3 - none required for now

OPTIONAL ARGS:
        ARG -- script_option_1 script_option-2 

OPTIONS:
	-h	help (usage info)
    	-V	Version of Linux-Bench Storage

ENVIRONMENT VARIABLES:

VIRTUAL = If unset, value is FALSE. Set to TRUE if running virtualized (automatically set for Docker)

EOF
}

# Verify if the script is executed with Root Privileges #
rootcheck() 
{
	if [[ $EUID -ne 0 ]]; then
   		echo "This script must be run as root" 
		echo "Ex. "sudo ./linux-bench.sh""
		exit 1
	fi
}


#Set Functions
setup()
{
	benchdir=`pwd`
	NEED_PTS=1

	date_str="+%Y_%m%d_%H%M%S"
	full_date=`date $date_str`
	host=$(hostname)
	log="linux-bench-storage"$rev"_"$host"_"$full_date.log
	if [ -f /.dockerinit ] ; then
		log=/data/"linux-bench-storage"$rev"_"$host"_"$full_date.log
	fi
        
	#outdir=$host"_"$full_date
	#mkdir $outdir
}
