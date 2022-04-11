#!/bin/sh

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
}

function getPWD2 {
unset password2
prompt="Enter Password-> "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password2+="$char"
done
}


if [ $# -lt 1 ] ; then
    echo
    echo "usage $0 folder_name/"
    exit 1
else
    MS=$1
    MSG=${MS%?}
    HME=`pwd`
    PATH=$HME:/usr/bin/:/bin/:/opt/local/bin/
    getPWD 
    UNO=$password
    echo
    getPWD2
    DOS=$password2
    pwd0=`echo "$UNO"| shasum -a 512 | cut -c1-128`
    pwd1=`echo "$DOS"| shasum -a 512 | cut -c1-128`
    if [ "$pwd0" == "$pwd1" ] ; then
       echo
       echo "passwords matched"
       #echo $pwd0
       #echo $pwd1
       tar cf - $MSG/ |gzip -c > $HME/$MSG.tgz
       ls -l $HME/$MSG.tgz
       echo "continue?"
       read x
       echo $password |gpg --pinentry-mode=loopback -u -e -c --passphrase-fd 0 $HME/$MSG.tgz
       ls  $MSG.gpg
    else
       echo "passwords you entered did not match!"
       exit 1
    fi
 exit 1
fi

