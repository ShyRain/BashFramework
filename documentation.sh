#!/bin/bash

source ${__pwd}inc/header.inc

## Framework dosyalarındaki açıklamaları topla
_documentation="documentation.txt"
_liste=`ls -1 | grep '.sh'`
for _script in ${_liste}
do 
	echo '---------------------------------------' >> ${__pwd}${_documentation}
	echo "Script Name : "$0 >> ${__pwd}${_documentation}
	cat ${_script} | grep '####' >> ${__pwd}${_documentation}
	echo '---------------------------------------' >> ${__pwd}${_documentation}
	echo '' >> ${__pwd}${_documentation}
	echo '' >> ${__pwd}${_documentation}
done
