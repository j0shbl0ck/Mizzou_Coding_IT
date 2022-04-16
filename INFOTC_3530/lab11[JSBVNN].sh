#  <<
# .SYNOPSIS
#     This script allows user interactiveness across the console
# .DESCRIPTION
#     Author: j0shbl0ck https://github.com/j0shbl0ck
#     Version: 1.0.0
#     Date: 04.15.22
#     Type: Public
# .NOTES
#      
# .LINK
#     
# >>
#! /bin/bash

clear
echo "Today's date and time is $(date)"
system=$(cat /etc/*release | grep ID_LIKE | cut -d"=" -f2)
echo "Your system family is $system "
echo "The IP addresses are $(ifconfig | grep broadcast | tr -s ' ' | cut -d' ' -f3)"

while true
do
        echo "==============================="
        echo "=========CYBER DEFENSE========="
        echo "===========Main Menu==========="
        echo "==============================="
        echo "1. Auditing user accounts. "
        echo "2. Auditing Hard Disk Drives (HDD)"
        echo "3. Auditing network configuration"
        echo "4. Update and upgrade the system"
        echo "5. Exit"
        read -p "Enter your choice: " choice

        case $choice in
                1)
                        echo "=====================Auditing user accounts====================="
                        echo "-> List of users created after Linux installation:"
                        echo $(awk -F: '($3>999 && $3<65534) {print $1}' /etc/passwd)
                        echo "-> List of users with elevated privileges added to the sudoers file:"
                        echo $(cat /etc/sudoers | grep ALL= | grep ^[^%#])
                        echo "-> List of users added to the wheel or sudo:"
                        echo $(cat /etc/group | grep 'sudo\|wheel' | awk -F: '{print $4}')
                ;;
                4)
                        echo "===================Update/upgrade the system==================="  
                        if [ $system == \"fedora\" ]
                        then
                                echo $(sudo yum update -y)
                        elif [ $system == debian ]
                        then
                                echo $(sudo apt update -y)
                        fi
                ;;
                5)      echo byei
                        clear
                        exit
                ;;
                *) echo Invalid option
                ;;
        esac
done