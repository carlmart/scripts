#!/bin/sh



if [ $# -lt 1 ] ; then
    echo
    echo "usage $0 folder_name/"
    exit 1
else

    MS=$1
    echo "MS = $MS"
    #MSG=${$MS:(-1)}
    MSG=${MS%?}
    echo "MSG = $MSG"
fi

