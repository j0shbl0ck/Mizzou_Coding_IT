#  <<
# .SYNOPSIS
#     This script allows user interactiveness across the console
# .DESCRIPTION
#     Author: j0shbl0ck https://github.com/j0shbl0ck
#     Version: 1.0.1
#     Date: 04.07.22
#     Type: Public
# .NOTES
#      
# .LINK
#     
# >>
#! /bin/bash



# ===== Operating system info =====
# if user selects 1 from main menu, call os_info function
function os_info {
    # create menu with five options and have user select one
    echo "==============================="
    echo "          OS Info              "
    echo "==============================="
    echo "1. Distribution"
    echo "2. Free/used memory"
    echo "3. Disk Space"
    echo "4. Uptime"
    echo "5. Return to main menu"
    echo "Enter your selection: "
    read os_info_selection
    case $os_info_selection in
        1) os_distro ;;
        2) mem_info ;;
        3) disk_space ;;
        4) uptime ;;
        5) main_menu ;;
        *) echo "Please enter a valid selection"
            os_info ;;
    esac
}

        # ===== Distribution info =====
        # if user selects 1 from os_info, call os_distro function
        function os_distro {
            clear
            # display OS distribution info
            echo "==============================="
            echo "          OS Distribution      "
            echo "==============================="
            # check if lsb_release is installed
            if [ -x "$(command -v lsb_release)" ]; then
                # if lsb_release is installed, display OS distribution info
                echo "Distribution: $(lsb_release -d | cut -f2)"
                echo "Release: $(lsb_release -r | cut -f2)"
                echo "Description: $(lsb_release -d | cut -f2)"
                echo "Codename: $(lsb_release -c | cut -f2)"
                echo "Kernel: $(uname -mrs)"
                echo "==============================="
            else
                # if lsb_release is not installed, display error message
                echo "lsb_release is not installed"
                # ask if they would like to install lsb_release
                read -p "Would you like to install lsb_release? (y/N)" lsb_release_install
                case $lsb_release_install in
                    y) sudo yum install redhat-lsb-core ;;
                    N) os_info ;;
                    *) echo "Invalid selection, returning to OS distribution menu" ;;
                esac                                                      
            fi
            os_info
        }

        # ===== Free/used memory info =====
        # if user selects 2 from os_info, call mem_info function
        function mem_info {
            # display free/used memory info
            echo "==============================="
            echo "          Memory Info          "
            echo "==============================="
            echo "Total memory: $(free -h | grep Mem | awk '{print $2}')"
            echo "Used memory: $(free -h | grep Mem | awk '{print $3}')"
            echo "Free memory: $(free -h | grep Mem | awk '{print $4}')"
            echo "==============================="
            os_info
        }

        # ===== Disk space info =====
        # if user selects 3 from os_info, call disk_space function
        function disk_space {
            # display disk space info
            echo "==============================="
            echo "          Disk Space           "
            echo "==============================="
            echo "Disk Space Inforation: "
            df -h
            echo "==============================="
            os_info
        }

        # ===== Uptime info =====
        # if user selects 4 from os_info, call uptime function
        function uptime {
            # display uptime info
            echo "==============================="
            echo "          Uptime               "
            echo "==============================="
            echo "Uptime: $(uptime | cut -d',' -f1 | cut -d',' -f3-)"
            echo "==============================="
            os_info
        }

# ===== Network info =====
# if user selects 2 from main menu, call network_info function
function network_info {
    # create menu with five options and have user select one
    echo "==============================="
    echo "          Network Info          "
    echo "==============================="
    echo "1. IP Address"
    echo "2. MAC Address"
    echo "3. Hostname"
    echo "4. Return to main menu"
    echo "Enter your selection: "
    read network_info_selection
    case $network_info_selection in
        1) ip_info ;;
        2) mac_info ;;
        3) hostname_info ;;
        4) main_menu ;;
        *) echo "Please enter a valid selection"
            network_info ;;
    esac
}

        # ===== IP info =====
        # if user selects 1 from network_info, call ip_info function
        function ip_info {
            # display IP info
            echo "==============================="
            echo "          IP Address           "
            echo "==============================="
            echo "IP Address: $(hostname -I)"
            echo "==============================="
            network_info
        }

        # ===== MAC info =====
        # if user selects 2 from network_info, call mac_info function
        function mac_info {
            # display MAC info
            echo "==============================="
            echo "          MAC Address          "
            echo "==============================="
            echo "MAC Address: $(ifconfig | grep -B1 'inet addr:' | grep -v '
            inet addr:' | cut -d: -f2 | awk '{print $1}')"
            echo "==============================="
            network_info
        }

        # ===== Hostname info =====
        # if user selects 3 from network_info, call hostname_info function
        function hostname_info {
            # display hostname info
            echo "==============================="
            echo "          Hostname             "
            echo "==============================="
            echo "Hostname: $(hostname)"
            echo "==============================="
            network_info
        }
        
# ===== User info =====
# if user selects 3 from main menu, call user_info function
function user_info {
    # create menu with five options and have user select one
    echo "==============================="
    echo "          User Info             "
    echo "==============================="
    echo "1. Add a user"
    echo "2. List users"
    echo "3. Signed in user"
    echo "4. Last logged in users"
    echo "5. Return to main menu"
    echo "Enter your selection: "
    read user_info_selection
    case $user_info_selection in
        1) add_user ;;
        2) list_users ;;
        3) signed_in_user ;;
        4) last_logged_in_users ;;
        5) main_menu ;;
        *) echo "Please enter a valid selection"
            user_info ;;
    esac
}

        # ===== Add a user =====
        # if user selects 1 from user_info, call add_user function
        function add_user {
            # add a user
            echo "==============================="
            echo "          Add a user           "
            echo "==============================="
            echo "Enter username: "
            read username
            echo "Enter password: "
            read -s password
            useradd -m -p $(openssl passwd -1 $password) $username
            echo "==============================="
            user_info
        }

        # ===== List users =====
        # if user selects 2 from user_info, call list_users function
        function list_users {
            # list users
            echo "==============================="
            echo "          List users           "
            echo "==============================="
            echo "Users: $(cat /etc/passwd | cut -d: -f1)"
            echo "==============================="
            user_info
        }

        # ===== Signed in user =====
        # if user selects 3 from user_info, call signed_in_user function
        function signed_in_user {
            # display signed in user
            echo "==============================="
            echo "          Signed in user       "
            echo "==============================="
            echo "Signed in user: $(whoami)"
            echo "==============================="
            user_info
        }

        # ===== Last logged in users =====
        # if user selects 4 from user_info, call last_logged_in_users function
        function last_logged_in_users {
            # display last logged in users
            echo "==============================="
            echo "          Last logged in users "
            echo "==============================="
            echo "Last logged in users: $(last | head -n -3 | tail -n +3 | awk '{print $1}')"
            echo "==============================="
            user_info
        }

# ===== File Operations =====
# if user selects 4 from main menu, call file_operations function
function file_operations {
    # create menu with five options and have user select one
    echo "==============================="
    echo "          File Operations        "
    echo "==============================="
    echo "1. Create a file"
    echo "2. Delete a file"
    echo "3. Create a directory"
    echo "4. Delete a directory"
    echo "5. Compress files "
    echo "6. Return to main menu"
    echo "Enter your selection: "
    read file_operations_selection
    case $file_operations_selection in
        1) create_file ;;
        2) delete_file ;;
        3) create_directory ;;
        4) delete_directory ;;
        5) compress_files ;;
        6) main_menu ;;
        *) echo "Please enter a valid selection"
            file_operations ;;
    esac
}

        # ===== Create a file =====
        # if user selects 1 from file_operations, call create_file function
        function create_file {
            # create a file
            echo "==============================="
            echo "          Create a file        "
            echo "==============================="
            echo "Enter file name: "
            read file_name
            touch $file_name
            echo "==============================="
            file_operations
        }

        # ===== Delete a file =====
        # if user selects 2 from file_operations, call delete_file function
        function delete_file {
            # delete a file
            echo "==============================="
            echo "          Delete a file        "
            echo "==============================="
            echo "Enter file name: "
            read file_name
            rm $file_name
            echo "==============================="
            file_operations
        }

        # ===== Create a directory =====
        # if user selects 3 from file_operations, call create_directory function
        function create_directory {
            # create a directory
            echo "==============================="
            echo "          Create a directory   "
            echo "==============================="
            echo "Enter directory name: "
            read directory_name
            mkdir $directory_name
            echo "==============================="
            file_operations
        }

        # ===== Delete a directory =====
        # if user selects 4 from file_operations, call delete_directory function
        function delete_directory {
            # delete a directory
            echo "==============================="
            echo "          Delete a directory   "
            echo "==============================="
            echo "Enter directory name: "
            read directory_name
            rmdir $directory_name
            echo "==============================="
            file_operations
        }

        # ===== Compress files =====
        # if user selects 5 from file_operations, call compress_files function
        function compress_files {
            # compress files
            echo "==============================="
            echo "          Compress files       "
            echo "==============================="
            echo "Enter file name: "
            read file_name
            tar -czf $file_name.tar.gz $file_name
            echo "==============================="
            file_operations
        }

# ===== Find files =====
# if user selects 5 from main menu, call find_files function
function find_files {
    # create menu with five options and have user select one
    echo "==============================="
    echo "          Find files            "
    echo "==============================="
    echo "1. Find files by name"
    echo "2. Find files by size"
    echo "3. Find files by date"
    echo "4. Find files by type"
    echo "5. Find files by owner"
    echo "6. Find files by group"
    echo "7. Return to main menu"
    echo "Enter your selection: "
    read find_files_selection
    case $find_files_selection in
        1) find_files_by_name ;;
        2) find_files_by_size ;;
        3) find_files_by_date ;;
        4) find_files_by_type ;;
        5) find_files_by_owner ;;
        6) find_files_by_group ;;
        7) main_menu ;;
        *) echo "Please enter a valid selection"
            find_files ;;
    esac
}

        # ===== Find files by name =====
        # if user selects 1 from find_files, call find_files_by_name function
        function find_files_by_name {
            # find files by name
            echo "==============================="
            echo "          Find files by name   "
            echo "==============================="
            echo "Enter file name: "
            read file_name
            find . -name $file_name
            echo "==============================="
            find_files
        }

        # ===== Find files by size =====
        # if user selects 2 from find_files, call find_files_by_size function
        function find_files_by_size {
            # find files by size
            echo "==============================="
            echo "          Find files by size   "
            echo "==============================="
            echo "Enter file size: "
            read file_size
            find . -size $file_size
            echo "==============================="
            find_files
        }

        # ===== Find files by date =====
        # if user selects 3 from find_files, call find_files_by_date function
        function find_files_by_date {
            # find files by date
            echo "==============================="
            echo "          Find files by date   "
            echo "==============================="
            echo "Enter date: "
            read date
            find . -mtime $date
            echo "==============================="
            find_files
        }

        # ===== Find files by type =====
        # if user selects 4 from find_files, call find_files_by_type function
        function find_files_by_type {
            # find files by type
            echo "==============================="
            echo "          Find files by type   "
            echo "==============================="
            echo "Enter file type: "
            read file_type
            find . -type $file_type
            echo "==============================="
            find_files
        }

        # ===== Find files by owner =====
        # if user selects 5 from find_files, call find_files_by_owner function
        function find_files_by_owner {
            # find files by owner
            echo "==============================="
            echo "          Find files by owner   "
            echo "==============================="
            echo "Enter owner: "
            read owner
            find . -user $owner
            echo "==============================="
            find_files
        }

        # ===== Find files by group =====
        # if user selects 6 from find_files, call find_files_by_group function
        function find_files_by_group {
            # find files by group
            echo "==============================="
            echo "          Find files by group   "
            echo "==============================="
            echo "Enter group: "
            read group
            find . -group $group
            echo "==============================="
            find_files
        }

# Create main menu function with six options and have user select one
function main_menu {
    clear
    echo "Today is $(date +"%m/%d/%Y") and the time is $(date +"%r")"
    echo "==============================="
    echo "          Main Menu            "
    echo "==============================="
    echo "1. Operating System Info"
    echo "2. Network Information"
    echo "3. User Information"
    echo "4. File Operations"
    echo "5. Find files"
    echo "6. Exit"
    echo "Enter your selection: "
    read main_menu_selection
    case $main_menu_selection in
        1) os_info ; main_menu ;;
        2) network_info ; main_menu ;;
        3) user_info ; main_menu ;;
        4) file_operations ; main_menu ;;
        5) find_files ; main_menu ;;
        6) exit 0 ;;
        *) echo "Please enter a valid selection"
           main_menu ;;
    esac
}

# show main menu
main_menu
