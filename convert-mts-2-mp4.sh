#!/bin/sh
# script to remove the extension of file name
ls *.MTS > list.txt
for i in `cat list.txt`
   do
      MS=$i
      MSG=`echo  $MS | awk -F. '{$NF=""; print $0}' | tr ' ' '.' | rev | cut -c 2- | rev`
      ffmpeg -i $i -c:v copy -c:a aac -strict experimental -b:a 128k $MSG.mp4
      echo
      #rm $i
   done


