#!/bin/sh



if [ $# -lt 1 ] ; then
    echo
    echo "usage $0 demo.tgz.gpg"
    exit 1
else

    MS=$1
    MSG=`echo  $MS | awk -F. '{$NF=""; print $0}' | tr ' ' '.' | rev | cut -c 2- | rev`
    echo "MSG = $MSG"
fi

