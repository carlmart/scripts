#!/bin/sh
#

 ffmpeg -i "concat:$(echo *.MTS | tr ' ' '|')" out.mp4
