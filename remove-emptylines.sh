#!/bin/sh
# bash or sh either works


if [ $# -lt 1 ] ; then
    clear
    echo
    echo "usage $0 inputfile.txt "
    exit 1
else

    MSG=$1
    # sed -i '/^ *$/d' $MSG
    grep "\S" $MSG
fi


