#  <<
# .SYNOPSIS
#     This script allows user interactiveness across the console
# .DESCRIPTION
#     Author: j0shbl0ck https://github.com/j0shbl0ck
#     Version: 1.0.2
#     Date: 04.07.22
#     Type: Public
# .NOTES
#      
# .LINK
#     
# >>
#! /bin/bash

# Create main menu function with six options
main_menu() {
    # Clear the screen
    clear
    # Display date and time
    echo "Today is $(date +"%m/%d/%Y") and the time is $(date +"%r")"
    echo "==============================="
    echo "          Main Menu            "
    echo "==============================="
    echo "1. Add a user"
    echo "2. List users"
    echo "3. Add an SSH key"
    echo "4. List SSH keys"
    echo "5. Exit"
    echo "6. Exit"
}

# Get user's choice
read -p "Enter your choice [1-6]: " choice
# repeat question if number is not between 1 and 6
while [ $choice -lt 1 ] || [ $choice -gt 6 ]
do
    echo "Invalid choice"
    read -p "Enter your choice [1-6]: " choice

    # ===== Operating system info =====
    # if option 1 is chosen from main menu create os function with 5 options
    if [ $choice -eq 1 ]; then
        os_menu() {
            echo "==============================="
            echo "          OS Menu              "
            echo "==============================="
            echo "1. Distribution"
            echo "2. Free/used memory"
            echo "3. Disk Space"
            echo "4. Uptime"
            echo "5. Return to main menu"
        }
        # Get user's choice
        read -p "Enter your choice [1-5]: " choice
        # repeat question if number is not between 1 and 6
        while [ $choice -lt 1 ] || [ $choice -gt 6 ]
        do
            echo "Invalid choice"
            read -p "Enter your choice [1-5]: " choice
        done
        # if option 1 is chosen from os menu display distribution then return to main menu
        if [ $choice -eq 1 ]; then
            echo "Distribution: "
            cat /etc/issue
            echo "*******************************"
            main_menu
            # if option 2 is chosen from os menu display free/used memory then return to main menu
        elif [ $choice -eq 2 ]; then
            echo "Free/used memory: "
            free -m
            echo "*******************************"
            main_menu
            # if option 3 is chosen from os menu display disk space then return to main menu
        elif [ $choice -eq 3 ]; then
            echo "Disk Space: "
            df -h
            echo "*******************************"
            main_menu
            # if option 4 is chosen from os menu display uptime then return to main menu
        elif [ $choice -eq 4 ]; then
            echo "Uptime: "
            uptime
            echo "*******************************"
            main_menu
            # if option 5 is chosen from os menu return to main menu
        elif [ $choice -eq 5 ]; then
            main_menu
        fi
    fi
    
    # ===== Network Information ===== 
    # if option 2 is chosen from main menu create network function displaying network information
    if [ $choice -eq 2 ]; then
        network_menu() {
            echo "==============================="
            echo "          Network Menu         "
            echo "==============================="
            echo "1. IP Address"
            echo "2. MAC Address"
            echo "3. Hostname"
            echo "4. Return to main menu"
        }
        # Get user's choice
        read -p "Enter your choice [1-4]: " choice
        # repeat question if number is not between 1 and 4
        while [ $choice -lt 1 ] || [ $choice -gt 4 ]
        do
            echo "Invalid choice"
            read -p "Enter your choice [1-4]: " choice
        done
        # if option 1 is chosen from network menu display ip address then return to main menu
        if [ $choice -eq 1 ]; then
            echo "IP Address: "
            ip addr
            echo "*******************************"
            main_menu
            # if option 2 is chosen from network menu display mac address then return to main menu
        elif [ $choice -eq 2 ]; then
            echo "MAC Address: "
            ifconfig
            echo "*******************************"
            main_menu
            # if option 3 is chosen from network menu display hostname then return to main menu
        elif [ $choice -eq 3 ]; then
            echo "Hostname: "
            hostname
            echo "*******************************"
            main_menu
            # if option 4 is chosen from network menu return to main menu
        elif [ $choice -eq 4 ]; then
            main_menu
        fi
    fi

    # ===== User Information =====
    # if option 3 is chosen from main menu create user function displaying user information
    if [ $choice -eq 3 ]; then
        user_menu() {
            echo "==============================="
            echo "        User Information       "
            echo "==============================="
            echo "1. Add a user"
            echo "2. List users"
            echo "3. Signed in user"
            echo "4. Last logged in users"
            echo "5. Return to main menu"
        }
        # Get user's choice
        read -p "Enter your choice [1-5]: " choice
        # repeat question if number is not between 1 and 5
        while [ $choice -lt 1 ] || [ $choice -gt 5 ]
        do
            echo "Invalid choice"
            read -p "Enter your choice [1-5]: " choice
        done
        # if option 1 is chosen from user menu ask to add a user then return to main menu
        if [ $choice -eq 1 ]; then
            read -p "Enter username: " username
            read -p "Enter password: " password
            useradd -m -p $password $username
            echo "*******************************"
            main_menu
            # if option 2 is chosen from user menu display users then return to main menu
        elif [ $choice -eq 2 ]; then
            echo "Users: "
            cat /etc/passwd
            echo "*******************************"
            main_menu
            # if option 3 is chosen from user menu display signed in user then return to main menu
        elif [ $choice -eq 3 ]; then
            echo "Signed in user: "
            who
            echo "*******************************"
            main_menu
            # if option 4 is chosen from user menu display last logged in users then return to main menu
        elif [ $choice -eq 4 ]; then
            echo "Last logged in users: "
            last
            echo "*******************************"
            main_menu
            # if option 5 is chosen from user menu return to main menu
        elif [ $choice -eq 5 ]; then
            main_menu
        fi
    fi

    # ===== File Operations =====
    # if option 4 is chosen from main menu create file function displaying file operations
    if [ $choice -eq 4 ]; then
        file_menu() {
            echo "==============================="
            echo "        File Operations        "
            echo "==============================="
            echo "1. Create a file"
            echo "2. Delete a file"
            echo "3. Create a directory"
            echo "4. Delete a directory"
            echo "5. Compress files "
            echo "6. Return to main menu"
        }
        # Get user's choice
        read -p "Enter your choice [1-6]: " choice
        # repeat question if number is not between 1 and 6
        while [ $choice -lt 1 ] || [ $choice -gt 6 ]
        do
            echo "Invalid choice"
            read -p "Enter your choice [1-6]: " choice
        done
        # if option 1 is chosen from file menu ask to create a file then return to main menu
        if [ $choice -eq 1 ]; then
            read -p "Enter file name: " filename
            # check if file exists and if so, ask user if they want to overwrite it, if yes, over file, if no, return to main menu
            if [ -f $filename ]; then
                read -p "File exists, overwrite? [y/n]: " overwrite
                if [ $overwrite == "y" ]; then
                    touch $filename
                    echo "*******************************"
                    main_menu
                elif [ $overwrite == "n" ]; then
                    main_menu
                else
                    # if y or n is not entered ask again
                    echo "Invalid choice"
                        read -p "Do you want to back them up to backup_bonus.tar? [yY/n]: " choice
                    fi
            else    
                touch $filename
                echo "*******************************"
                main_menu
            fi
            # if option 2 is chosen from file menu ask to delete a file then return to main menu
        elif [ $choice -eq 2 ]; then
            read -p "Enter file name: " filename
            rm $filename
            # check if deletion was successful, if so display exit code else display error exit code
            if [ -f $filename ]; then
                echo "Error deleting file"
                echo "*******************************"
                main_menu
            else
                echo "File deleted"
                echo "*******************************"
                main_menu
            fi
            # if option 3 is chosen from file menu ask to create a directory then return to main menu
        elif [ $choice -eq 3 ]; then
            read -p "Enter directory name: " dirname
            mkdir $dirname
            # check if creation was successful, if so prompt user to enter the OCTAL permissions of the directory else display error exit code
            if [ -d $dirname ]; then
                read -p "Enter permissions [octal]: " permissions
                chmod $permissions $dirname
                echo "*******************************"
                main_menu
            else
                echo "Error creating directory"
                echo "*******************************"
                main_menu
            fi
            # if option 4 is chosen from file menu ask to delete a directory then return to main menu
        elif [ $choice -eq 4 ]; then
            read -p "Enter directory name: " dirname
            rmdir $dirname
            # check if deletion was successful, if so display exit code else display error exit code
            if [ -d $dirname ]; then
                echo "Error deleting directory"
                echo "*******************************"
                main_menu
            else
                echo "Directory deleted"
                echo "*******************************"
                main_menu
            fi
            # if option 5 is chosen from file menu ask to compress files then return to main menu
        elif [ $choice -eq 5 ]; then
            read -p "Enter file name: " filename
            read -p "Enter directory name: " dirname
            tar -czf $dirname.tar.gz $filename
            echo "*******************************"
            main_menu
            # if option 6 is chosen from file menu return to main menu
        elif [ $choice -eq 6 ]; then
            main_menu
        fi
    fi

    # ===== Find Files =====
    # if option 5 is chosen from main menu create find function displaying find files
    if [ $choice -eq 5 ]; then
        find_menu() {
            echo "==============================="
            echo "        Find Files             "
            echo "==============================="
            echo "1. Find files by name"
            echo "2. Find files by size"
            echo "3. Find files by date"
            echo "4. Find files by type"
            echo "5. Find files by owner"
            echo "6. Find files by group"
            echo "7. Return to main menu"
        }
        # Get user's choice
        read -p "Enter your choice [1-7]: " choice
        # repeat question if number is not between 1 and 7
        while [ $choice -lt 1 ] || [ $choice -gt 7 ]
        do
            echo "Invalid choice"
            read -p "Enter your choice [1-7]: " choice
        done
        # if option 1 is chosen from find menu ask to find files by name then return to main menu
        if [ $choice -eq 1 ]; then
            read -p "Enter file name: " filename
            find . -name $filename
            # if files are found, ask if user wants to back them up to backup_bonus.tar else return to main menu
            if [ -f $filename ]; then
                read -p "Do you want to back them up to backup_bonus.tar? [yY/n]: " choice
                # if user presses y or Y, create a tar file with the files found or if user presses n or N, return to main menu else repeat question
                if [ $choice == "y" ] || [ $choice == "Y" ]; then
                    # check if tar file exists, if so, add files to tar file else create tar file and add files to it
                    if [ -f backup_bonus.tar ]; then
                        tar -rvf backup_bonus.tar $filename
                    else
                        tar -rvf backup_bonus.tar $filename
                    fi
                    echo "*******************************"
                    main_menu
                elif [ $choice == "n" ] || [ $choice == "N" ]; then
                    echo "*******************************"
                    main_menu
                else
                    echo "Invalid choice"
                    read -p "Do you want to back them up to backup_bonus.tar? [yY/n]: " choice
                fi
            else
                echo "*******************************"
                main_menu
            fi
            # if option 2 is chosen from find menu ask to find files by size then return to main menu
        elif [ $choice -eq 2 ]; then
            read -p "Enter file size: " filesize
            find . -size $filesize
            echo "*******************************"
            main_menu
            # if option 3 is chosen from find menu ask to find files by date then return to main menu
        elif [ $choice -eq 3 ]; then
            read -p "Enter file date: " filedate
            find . -mtime $filedate
            echo "*******************************"
            main_menu
            # if option 4 is chosen from find menu ask to find files by type then return to main menu
        elif [ $choice -eq 4 ]; then
            read -p "Enter file type: " filetype
            find . -type $filetype
            # ask user if they would like to change the file type
            read -p "Do you want to change the file type? [yY/nN]: " choice
            # if user presses y or Y, ask user to enter new file type else return to main menu
            if [ $choice == "y" ] || [ $choice == "Y" ]; then
                read -p "Enter new file type: " newfiletype
                find . -type $newfiletype
                echo "*******************************"
                main_menu
            elif [ $choice == "n" ] || [ $choice == "N" ]; then
                echo "*******************************"
                main_menu
            else
                echo "Invalid choice"
                read -p "Do you want to change the file type? [yY/nN]: " choice
            fi
            echo "*******************************"
            main_menu
            # if option 5 is chosen from find menu ask to find files by owner then return to main menu
        elif [ $choice -eq 5 ]; then
            read -p "Enter file owner: " fileowner
            find . -user $fileowner
            echo "*******************************"
            main_menu
            # if option 6 is chosen from find menu ask to find files by group then return to main menu
        elif [ $choice -eq 6 ]; then
            read -p "Enter file group: " filegroup
            find . -group $filegroup
            echo "*******************************"
            main_menu
            # if option 7 is chosen from find menu return to main menu
        elif [ $choice -eq 7 ]; then
            main_menu
        fi
    fi

    # ===== Exit =====
    # if option 6 is chosen from main menu exit the program
    if [ $choice -eq 6 ]; then
        exit
    fi
done









