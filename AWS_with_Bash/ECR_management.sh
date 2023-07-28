#!/bin/bash

function create_repository() {
    read -p "Enter Repository name: " repository_name
    read -p "Enter Region: " reg
    repo=$(aws ecr create-repository \
        --repository-name $repository_name \
        --image-scanning-configuration scanOnPush=true \
        --region $reg | jq -r '.repository.repositoryUri')
    echo "URI is: $repo"
}

function list_images() {
    read -p "Enter Repository name: " repository_name
    aws ecr list-images --repository-name $repository_name
}

function tag_images() {
    docker images

    read -p "Enter Image name: " img
    read -p "Enter Image Tag: " tag
    read -p "Enter Repo Tag: " reptag
    echo "docker tag $img:$tag $repo:$reptag"
    docker tag $img:$tag $repo:$reptag
}

function push_images() {
    read -p "Enter tag: " tg
    docker push $repo:$tg
}

function reg_auth() {
    read -p "Enter Region: " region
    aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $(echo $repo | cut -d'/' -f1)
}

function delete_repo() {
    read -p "Enter Repository Name: " name
    aws ecr delete-repository \
        --repository-name $name \
        --force
}

while :
do
    echo """
        1. Create Repository
        2. List of Images
        3. Tag images
        4. Push Images
        5. Delete Repository
        6. Docker Login
        0. Exit
        """

    read -p "Enter your choice: " choice 
    case $choice in
        1)
            create_repository
        ;;
        2)
            list_images
        ;;
        3)
            tag_images
        ;;
        4)
            push_images
        ;;
        5)
            delete_repo
        ;;
        6)
            reg_auth
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
