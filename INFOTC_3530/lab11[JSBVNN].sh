#  <<
# .SYNOPSIS
#     This script allows user interactiveness across the console
# .DESCRIPTION
#     Author: j0shbl0ck https://github.com/j0shbl0ck
#     Version: 1.0.1
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
                2)
                        echo "=====================Auditing Hard Disk Drives (HDD)====================="
                        echo "-> List of mounted drives:"
                        echo $(mount | cut -d' ' -f1)
                        echo "-> List of mounted drives with their mount points:"
                        echo $(mount | cut -d' ' -f1,2)
                        echo "-> List of mounted drives with their mount points and filesystems:"
                        echo $(mount | cut -d' ' -f1,2,3)
                        echo "-> List of mounted drives with their mount points, filesystems and options:"
                        echo $(mount | cut -d' ' -f1,2,3,4)
                        echo "-> List of mounted drives with their mount points, filesystems, options and mount points:"
                        echo $(mount | cut -d' ' -f1,2,3,4,5)
                ;;
                3)          
                        echo "=====================Auditing network configuration====================="
                        echo "-> List of network interfaces:"
                        echo $(ifconfig | cut -d' ' -f1)
                        echo "-> List of network interfaces with their IP addresses:"
                        echo $(ifconfig | cut -d' ' -f1,2)
                        echo "-> List of network interfaces with their IP addresses and netmask:"
                        echo $(ifconfig | cut -d' ' -f1,2,4)
                        echo "-> List of network interfaces with their IP addresses, netmask and broadcast address:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5)
                        echo "-> List of network interfaces with their IP addresses, netmask, broadcast address and MAC address:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5,8)
                        echo "-> List of network interfaces with their IP addresses, netmask, broadcast address, MAC address and status:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5,8,9)
                        echo "-> List of network interfaces with their IP addresses, netmask, broadcast address, MAC address, status and MTU:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5,8,9,12)
                        echo "-> List of network interfaces with their IP addresses, netmask, broadcast address, MAC address, status, MTU and speed:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5,8,9,12,13)
                        echo "-> List of network interfaces with their IP addresses, netmask, broadcast address, MAC address, status, MTU, speed and duplex:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5,8,9,12,13,14)
                        echo "-> List of network interfaces with their IP addresses, netmask, broadcast address, MAC address, status, MTU, speed and duplex and carrier:"
                        echo $(ifconfig | cut -d' ' -f1,2,4,5,8,9,12,13,14,15)
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