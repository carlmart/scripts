#!/bin/sh
#
function check_file
{
     if  test -f "$MSG"; then
        echo "file exists"
        echo "continue"
     else
        echo "file not found!"
        echo "Exiting... !"
        exit 1
     fi
}


if [ $# -lt 1 ] ; then
    clear
    echo
    echo "usage $0 file.txt "
    exit 1
else
    MSG=$1
    check_file
    echo $MSG
fi

