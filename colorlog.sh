#!/bin/bash

###################################################################
## Write Log
## LOG should be declared
## if not declared, it can be created with script name

function log(){
    ## Variables
    local ScriptName=`basename $0`
    local Date=`date +"%Y.%m.%d-%H.%M.%S"`
    local Rotate=`date +"%Y-%m-%d"` 

  ## Colors
	echoBlue="echo -e \e[1;34m"
	echoRed="echo -e \e[1;31m"
	echoCyan="echo -e \e[1;36m"
	echoGreen="echo -e \e[1;32m"
	echoYellow="echo -e \e[1;33m"
	echoMagenta="echo -e \e[1;35m"
	echoWhite="echo -e \e[1;37m"
    
	## Check log file 
    if [[ ! ${LOG} ]]
	then 
		LOG="/tmp/"${ScriptName}'-'${Rotate}'.log'
	else
		local LogDummy=$LOG
		LogDummy1=`echo ${LogDummy} | awk -F'.' '{ print $1 }'`
		LOG=${LogDummy1}'-'${Rotate}'.log'
	fi
   
	## Check parameters
	case "$1" in
	'-w')  
    	## Save Log
		shift
    	$echoRed "${Date} : $@ \e[0m"
    	## Show Log
    	echo "${Date} : $@" >> ${LOG}
		;;
	'-i')  
		## Save Log
		shift
        $echoGreen "${Date} : $@ \e[0m"
        ## Show Log
        echo "${Date} : $@" >> ${LOG}
    	;;
	'-e')
        ## Save Log
		shift
        $echoMagenta "${Date} : $@ \e[0m"
        ## Show Log
        echo "${Date} : $@" >> ${LOG}
        ;;
	'-d')
 		## Save Log
		shift
        $echoBlue "${Date} : $@ \e[0m"
        ## Show Log
        echo "${Date} : $@" >> ${LOG}
	   ;;
	*)
		echo "${Date} : $@" | tee -a ${LOG}
		;;
	esac 
}
##################################################################
