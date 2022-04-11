#!/bin/sh
#
# example: file input = name.mov / fileoutput = name.mp4
#
# list of files *.mov
for i in `cat list.txt`  
  do
   MS=`echo $i`       # original
   MSG=${MS%?}          # remove last char 1
   MSG1=${MSG%?}        # remove last char 2
   MSG2=${MSG1%?}        # remove last char 3
   MSG3=${MSG2%?}        # remove last char 3
   echo " original $MS  :: output $MSG3.mp4"
   ffmpeg -i $MS  -vcodec libx265 -crf 28 $MSG3.mp4
  done
