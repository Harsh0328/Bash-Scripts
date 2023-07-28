#!/bin/bash

function list_user() {
    aws iam list-users
}

function list_group() {
    aws iam list-groups
}

function list_of_user_in_group() {
    read -p "Enter group name: " groupname
    aws iam get-group --group-name $groupname
}

function create_user() {
    read -p "Enter user name: " username
    aws iam create-user --user-name $username
    echo "User '$username' successfully created."
}

function create_group() {
    read -p "Enter group name: " groupname
    aws iam create-group --group-name $groupname
    echo "Group '$groupname' successfully created."
}

function add_user_to_group() {
    read -p "Enter user name: " username
    read -p "Enter group name: " groupname
    aws iam add-user-to-group --user-name $username --group-name $groupname
    echo "User '$username' added to group '$groupname'."
}

function delete_user() {
    read -p "Enter user name: " username
    aws iam delete-user --user-name $username
    echo "User '$username' successfully DELETED."
}

function delete_group() {
    read -p "Enter group name: " groupname
    aws iam delete-group --group-name $groupname
    echo "Group '$groupname' successfully DELETED."
}

function remove_user_from_group() {
    read -p "Enter user name: " username
    read -p "Enter group name: " groupname
    aws iam remove-user-from-group --user-name $username --group-name $groupname
    echo "User '$username' removed from group '$groupname' successfully."
}

while :
do
    echo """
        AWS IAM Management Script
        ___________________________
        1. List Users
        2. List Groups
        3. List Users in a Group
        ___________________________
        4. Create User
        5. Create Group
        6. Add User to Group
        7. Delete User
        8. Delete Group
        9. Remove User from Group
        0. Exit
        """

    read -p "Enter your choice: " choice
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
        7)
            delete_user
        ;;
        8)
            delete_group
        ;;
        9)
            remove_user_from_group
        ;;
        0) 
            echo "Exiting"
            exit 0
        ;;
        *)
            echo "Invalid choice. Try again."
            sleep 1
        ;;
    esac
done
