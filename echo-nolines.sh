#!/bin/sh
DT=`date +%m-%d-20%y`

# usage: last_seen variable
last_seen () 
{ 
  echo "$DT: $M2"
  echo  "last seen :" 
  # printf %s "last seen :"    # prints without newline character on bash and sh
  grep $M2 $DT.txt 
 
}


M2="b81c55bb"
last_seen  $M2  
