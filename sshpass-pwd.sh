#!/bin/sh
DT=`date +%m-%d-20%y`
function getPWD  {
unset password
prompt="Enter Password-> "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password+="$char"
done
echo "-----------------"
}


U="user@server.edu"
F="/Users/rico/$DT-myfiles.tgz"
T="/User/rico/upload/"

getPWD
tar cf - /Users/rico/ | gzip -c > $F
#scp $F $U:$T
# sshpass -p $password scp -r $F $U:$T
/usr/local/bin/sshpass -p $password scp $F $U:$T

