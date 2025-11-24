🟦 Linux User Management Automation Script
Project 2 – Linux System Administration Portfolio | By Fahath
📌 Project Overview

This project automates common Linux user administration tasks using a simple Bash script.
It is designed for real-world scenarios where system administrators must manage multiple users efficiently and securely.

This script supports:

✅ Creating users
✅ Deleting users
✅ Changing passwords
✅ Listing all system users

This project demonstrates essential Linux administration skills expected from:

Linux System Administrators

DevOps Engineers

Cloud Support Engineers

🛠️ Technologies Used
Component	Description
OS	Rocky Linux 9 (or any RHEL-based Linux)
Script Type	Bash Shell Script
Tools	useradd, userdel, passwd, cut
Shell	bash
📁 Repository Structure
02-user-management/
│
├── user_mgmt.sh     # Main script
└── README.md        # Project documentation

🚀 Features
1️⃣ Create Users

Checks if user already exists

Creates user

Prompts for secure password

2️⃣ Delete Users

Checks if user exists

Deletes home directory (-r flag)

3️⃣ Update User Passwords

Uses passwd safely

4️⃣ List All System Users

Uses /etc/passwd

Extracts usernames properly

📜 Script (user_mgmt.sh)
#!/bin/bash

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
    
4)
    echo "Listing all local system users:"
    cut -d: -f1 /etc/passwd
    ;;
    
5)
    echo "Exiting..."
    exit 0
    ;;
    
*)
    echo "Invalid option! Choose between 1–5."
    ;;
esac

▶️ How to Run the Script
1. Give permission
chmod +x user_mgmt.sh

2. Run using sudo
sudo ./user_mgmt.sh
