#!/bin/sh
# 
# 
FL="filelist.txt"

getword_file()
{
  echo "debug:1"
  echo "MSG = $MSG"
  grep $MSG  $FL
  echo "debug:2"
}



if [ $# -lt 1 ] ; then
    clear
    echo
    echo "usage $0 keyword_2_search "
    exit 1
else

    MSG=$1
    echo "Searching inside file: $FL"
    echo
    getword_file $MSG

fi

