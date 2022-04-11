#!/bin/sh
# bash or sh either works
# https://stackoverflow.com/questions/20449543/shell-equality-operators-eq
# = and == are for string comparisons, -eq is for numeric ones. -eq is in the same family as -lt, -le, -gt, -ge, and -ne
# $ a=foo
# $ if [ "$a" = foo ];        # POSIX sh         strings only comparison
# $ if [ "$a" == foo ];       # bash specific    strings only comparison
# $ if [ "$a" -eq foo ];      # wrong            numeric only -eq -lt, -le, -gt, -ge, and -ne
# -bash: [: foo: integer expression expected


if [ $# -lt 1 ] ; then
    clear
    echo
    echo "usage $0 keyword "
    exit 1
else

    MSG=$1
    echo $MSG
fi

