#  <<
# .SYNOPSIS
#     This script allows the user to define the initial and last octet for the 192.168.200.0/24 network in order to ping sweep that particular IP range.
# .DESCRIPTION
#     Author: Josh Block
#     Version: 1.0.1
#     Date: 04.15.22
#     Type: Public
# .NOTES
#      
# .LINK
#     
# >>
#! /bin/bash


# Ask user for inital octet of 192.168.200.0/24
echo "Enter the initial octet of the IP range you want to scan: "
read initial_octet

# Ask user for last octet of 192.168.200.0/24
echo "Enter the last octet of the IP range you want to scan: "
read last_octet

# ping sweep 
for ip in $(seq $initial_octet 1 $last_octet); do
    ping -c1 192.168.200.$ip &> /dev/null
    if [ $? -eq 0 ]; then
        echo "192.168.200.$ip is up"
    fi
done
