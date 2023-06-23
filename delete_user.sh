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

function delete_user() {
    read -p "Enter user name : " username 
    aws iam delete-user --user-name $username 
    echo "User successfully DELETED"
}

function delete_group() {
    read -p "Enter group name : " groupname
    aws iam delete-group --group-name $groupname
    echo "Group successfully DELETED."
}

function remove_user_from_group() {
    read -p "Enter user name : " username groupname
    aws iam remove-user-from-group --user-name $username --group-name $groupname
    echo "Removed user from group successfully."
    }
while :
do
    echo """
        1. List of Users
        2. List of Groups
        3. List of Users in a group
        ___________________________
        4. Delete user
        5. Delete group
        6. Remove User from Group
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
            delete_user
        ;;
        5)
            delete_group
        ;;
        6)
            remove_user_from_group
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