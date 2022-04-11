#!/bin/bash
# my stackoverflow question 
# https://stackoverflow.com/questions/71578894/how-do-i-watch-for-a-process-to-have-died-in-shell-script
# if null https://www.cyberciti.biz/faq/bash-shell-find-out-if-a-variable-has-null-value-or-not/
# kill -0 $pid https://stackoverflow.com/questions/11012527/what-does-kill-0-pid-in-a-shell-script-do
# original Q https://stackoverflow.com/questions/71578894/how-do-i-watch-for-a-process-to-have-died-in-shell-script

dash='*****'

sleeping()
{
 echo "sleeping for 10 seconds"
 sleep 10 & >> /dev/null
}

sleeping
pid=$!           # grabs the process id from prev function
echo "debug1: pid = $pid"

npid=$pid   # new pid
echo "debug2: npid = $npid"

null=`ps -a |grep -v grep | grep  $pid | cut -c1-6`
echo "debug3: null = $null"

#while [ $pid -eq $npid ]   # original works , two integers
while [ $pid == $npid ]
  do
   for i in "${dash[@]}"
     do
        echo -ne "\b$i"
        sleep 0.1
     done 
   npid=`ps -a |grep -v grep | grep  $pid | cut -c1-6`
   #echo "debug4: npid = $npid"
   if [ -z "$npid"  ] ; then 
      echo
      exit 0
   fi
  done
