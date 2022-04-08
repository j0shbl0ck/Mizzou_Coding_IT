#!/bin/bash
# Josh Block - JSBVNN
# 3.27.22

# script should receive a service name and output the status of the service, including the user account who executed the script, and the date and time when the script was executed.

# ask for service name
echo "Enter service name: "
read SERVICE

# check if service is running, if so, show user and date
if systemctl status $SERVICE | grep -i "running" > /dev/null
then
    running="[ $(whoami) ] [ $(date) ] The $SERVICE service is running"
    echo $running
    echo "$running" >> /tmp/services.log
    # ask user to stop service
    echo "Would you like to stop the $SERVICE service? (y/n)"
    read ANSWER
    if [ $ANSWER == "y" ]
    then
        systemctl stop $SERVICE
        stopped="[ $(whoami) ] [ $(date) ] The $SERVICE service has been stopped"
        echo $stopped
        echo "$started" >> /tmp/services.log
    fi
    # if user does not enter y or n, repeat question
    while [ $ANSWER != "y" ] && [ $ANSWER != "n" ]
    do
        echo "Please enter y or n"
        read ANSWER
    done
else
    # check if service is stopped, if so, show user and date
    if systemctl status $SERVICE | grep -i "exited" > /dev/null
    then
        installed="[ $(whoami) ] [ $(date) ] The $SERVICE service is installed but stopped"
        echo $installed
        echo "$installed" >> /tmp/services.log
        # ask user to start service
        echo "Would you like to start the $SERVICE service? (y/n)"
        read ANSWER
        if [ $ANSWER == "y" ]
        then
            systemctl start $SERVICE
            started="[ $(whoami) ] [ $(date) ] The $SERVICE service has been started"
            echo $started
            echo "$started" >> /tmp/services.log
        fi
        # if user does not enter y or n, repeat question
        while [ $ANSWER != "y" ] && [ $ANSWER != "n" ]
        do
            echo "Please enter y or n"
            read ANSWER
        done
    else
        # check if service is not installed, if so, show user and date
        nfound="[ $(whoami) ] [ $(date) ] The $SERVICE service is not installed" 
        echo $nfound
        echo "$nfound" >> /tmp/services.log

    fi
fi









