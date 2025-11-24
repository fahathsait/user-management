#!/bin/bash

# ---------------------------------------------
# Linux User Management Automation Script
# Author: Fahath
# Description:
#   This script allows admins to:
#     - Create users
#     - Delete users
#     - Change passwords
#     - List all system users
# ---------------------------------------------

echo "--------------------------------------"
echo "   LINUX USER MANAGEMENT SYSTEM"
echo "--------------------------------------"

echo "Choose an option:"
echo "1) Create a new user"
echo "2) Delete a user"
echo "3) Change a user password"
echo "4) List all users"
echo "5) Exit"

read -p "Enter your choice: " choice

case $choice in

1)
    read -p "Enter username to create: " uname
    if id "$uname" &>/dev/null; then
        echo "User already exists!"
    else
        useradd "$uname"
        passwd "$uname"
        echo "User '$uname' created successfully!"
    fi
    ;;
    
2)
    read -p "Enter username to delete: " uname
    if id "$uname" &>/dev/null; then
        userdel -r "$uname"
        echo "User '$uname' deleted!"
    else
        echo "User does not exist!"
    fi
    ;;
    
3)
    read -p "Enter username to change password: " uname
    if id "$uname" &>/dev/null; then
        passwd "$uname"
        echo "Password updated successfully!"
    else
        echo "User does not exist!"
    fi
    ;;
