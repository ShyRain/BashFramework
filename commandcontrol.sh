#!/bin/bash

##################################################################
function cmd(){ 
"$@"
if [[ $? -eq 0 ]]
then
    log -i $@ "command successfully run."
    RESULT=0
else
    log -e "[ERROR][!fail!] "$@" cannot success!";
    RESULT=1
fi
return $RESULT;
}

##################################################################
