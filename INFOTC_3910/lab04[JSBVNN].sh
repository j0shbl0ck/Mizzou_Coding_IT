#  <<
# .SYNOPSIS
#     This script allows the user to define the initial and last octet for the 192.168.200.0/24 network in order to ping sweep that particular IP range.
# .DESCRIPTION
#     Author: j0shbl0ck https://github.com/j0shbl0ck
#     Version: 1.0.3
#     Date: 07.05.22
#     Type: Public
# .NOTES
#      
# .LINK
#     
# >>
#! /bin/bash


# Ask user for inital octet of 192.168.200.0/24 in yellow
echo "\e[33mEnter the initial octet of the IP range you want to ping sweep: \e[0m"
read initial_octet

# Ask user for last octet of 192.168.200.0/24 in blue
echo "\e[34mEnter the last octet of the IP range you want to scan: \e[0m"
read last_octet

# ping sweep in order
for ip in $(seq $initial_octet 1 $last_octet); do
    ping -c 1 192.168.200.$ip
done
