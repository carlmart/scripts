#!/bin/bash
# https://apple.stackexchange.com/questions/223331/how-to-disable-game-center-process-gamed-on-os-x-10-11-el-capitan
# Use Automator in OS X to create a bash script then add it as a Login Item to your OS X account. 
# The next time you login you should receive a prompt to execute the script. 
        chkService=gamed
        chkCount=10
        chkStatus=$(ps ax | grep "$chkService" | grep -v grep | grep " T " | wc -l)
        while [ $chkStatus -ne 1 ]; do
            chkProcess=$(ps ax | grep -v grep | grep "$chkService" | wc -l)
            if [ $chkProcess -ne 0 ];
            then
                KILLALL -STOP "$chkService"
                chkCount=0
                chkStatus=$(ps ax | grep gamed | grep -v grep | grep " T " | wc -l)
            else
                SLEEP=1
                chkCount=$((chkCount-1))
            fi
        done
