#!/bin/bash
# Pequeña modificación al script de logdir el cual dependiendo del espacio ocupado, este cambiara de color o emitirá alguna alerta sonora dependiendo del caso.
while true
do 
    clear
    SPECS=""
    PLAIN_CURRNET_SPACE="$(df -h /usr/local/bphx/logdir)"
    SPACE=$(df -h --output=pcent /usr/local/bphx/logdir | awk "NR==2 {print $1}" | awk -F % '{print $1}')
    if (( SPACE < 40 )); then
      SPECS="\033[32m"  
    elif (( SPACE >= 40 && SPACE < 60 )); then
      SPECS="\033[38;5;208m"  
    elif (( SPACE >= 60)); then
      SPECS="\033[31m"  
    else
      SPECS=""
    fi

    date +%c
    echo -e "${SPECS}$PLAIN_CURRNET_SPACE \033[0m"
    sleep 15
done
#