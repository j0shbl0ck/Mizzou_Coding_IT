#  <<
# .SYNOPSIS
#     This script allows user interactiveness across the console
# .DESCRIPTION
#     Author: j0shbl0ck https://github.com/j0shbl0ck
#     Version: 1.0.2
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
                    # Display username, exact date/time and IP address for the users who logged in to the system, ordered by date (oldest to newest).
                    echo "-> List of users who logged in to the system:"
                    echo $(last | grep -v "Never" | awk '{print $1, $3, $4}')
                    # Display in ascending order the date and time when the last user account was created.
                    echo "-> Last user account created:"
                    echo $(last | grep -v "Never" | awk '{print $1, $3, $4}' | sort -k3 | tail -1)
                    # Display the usernames who are currently online
                    echo "-> List of users who are currently online:"
                    echo $(who | awk '{print $1}')
                ;;
                2)
                    echo "=====================Auditing Hard Disk Drives (HDD)====================="
                    # Display the total number of HDD, their names, their partitions, and the mounting point
                    echo "-> List of Hard Disk Drives (HDD):"
                    echo $(lsblk | grep disk | awk '{print $1, $4, $7}')
                ;;
                3)          
                    echo "=====================Auditing network configuration====================="
                    # Display the network adapter, the IP address, subnet mask, and the MAC address. Format the output to only include the requested info
                    echo "-> List of network adapters:"
                    echo $(ifconfig | grep -v "lo" | awk '{print $1, $2, $4, $5}')
                    # Display services information for the first 100 ports that have the state of LISTEN, omit localhost output (hint: explore the netstat -tulpn command)
                    echo "-> List of services listening on ports:"
                    echo $(netstat -tulpn | grep LISTEN | head -n 100)
                4)
                    echo "===================Update/upgrade the system==================="
                    # Update and upgrade the system (hint: different distributions use different package managers! Use the partial implementation to help with this)
                    if [ $system == \"fedora\" ]
                    then
                            echo $(sudo yum update -y)
                    elif [ $system == debian ]
                    then
                            echo $(sudo apt update -y)
                    fi
                ;;
                5)      
                    echo bye
                    clear
                    exit
                ;;
                *) echo Invalid option
                ;;
        esac
done