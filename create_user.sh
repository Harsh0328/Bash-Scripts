#!/bin/bash


function list_user() {
    aws iam list-users
}

function list_group() {
    aws iam list-groups
}

function list_of_user_in_group() {
    read -p "Enter user name : " username
    aws iam get-group --group-name $username
}

function create_user() {
    read -p "Enter user name : " username 
    aws iam create-user --user-name $username 
    echo "User successfully created"
}

function create_group() {
    read -p "Enter group name : " groupname
    aws iam create-group --group-name $groupname
    echo "Group successfully created"
}

function add_user_to_group() {
    read -p "Enter user name : " username groupname
    aws iam add-user-to-group --user-name $username --group-name $groupname
    echo "User added into group"
    }
while :
do
    echo """
        1. List of Users
        2. List of Groups
        3. List of Users in a Group
        ___________________________
        3. Create user
        4. Create group
        5. Add user into aroup
        0. Exit
        """

    read -p "Enter your choice : " choice 
    case $choice in
        1)
            list_user
        ;;
        2)
            list_group
        ;;
        3)
            list_of_user_in_group
        ;;
        4)
            create_user
        ;;
        5)
            create_group
        ;;
        6)
            add_user_to_group
        ;;
        0) 
            echo "Exiting"
            exit 0
        ;;
        *)
            echo "Invalid choice. Try again."
        ;;
    esac
done