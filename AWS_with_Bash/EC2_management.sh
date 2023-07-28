#!/bin/bash

function create_security_group() {
    read -p "Enter Security Group Name: " group_name
    read -p "Enter description: " description
    read -p "Enter VPC ID: " vpc_id
    GroupID=$(aws ec2 create-security-group --group-name "$group_name" --description "$description" --vpc-id "$vpc_id" | jq -r '.GroupId')

    if [ $? -eq 0 ]; then
        echo "Successfully created Security Group"
    else
        echo "Failed to create Security Group"
    fi

    echo "GroupID=$GroupID" 
}

function delete_security_group() {
    read -p "Enter Security Group ID to delete: " group_id
    aws ec2 delete-security-group --group-id "$group_id"
    echo "Security Group with ID $group_id deleted."
}

function create_ec2() {
    read -p "Enter Image ID: " ImageID
    read -p "Enter instance type: " ec2type
    read -p "Enter Security Key: " sec_key
    read -p "Enter Security Group ID: " group_id
    InstanceID=$(aws ec2 run-instances --image-id "$ImageID" --count 1 --instance-type "$ec2type" --key-name "$sec_key" --security-group-ids "$group_id" | jq -r '.Instances[0].InstanceId')

    echo "InstanceID is : $InstanceID"
}

function terminate_ec2() {
    read -p "Enter Instance ID to terminate: " instance_id
    aws ec2 terminate-instances --instance-ids "$instance_id"
    echo "Instance with ID $instance_id terminated."
}

function list_of_ec2() {
    InstanceID=$(aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId')
    echo "InstanceID is : $InstanceID"
}

function copy_ami_to_another_region() {
    read -p "Enter New Region: " region
    read -p "Enter Name: " name
    read -p "Enter Source Region: " src_region
    read -p "Enter Source ImageId: " ImageId

    aws ec2 copy-image \
        --region "$region" \
        --name "$name" \
        --source-region "$src_region" \
        --source-image-id "$ImageId" \
        --description "This is my copied image." \
        --copy-image-tags
}

while :
do
    echo """
        1. Create Security Group
        2. Create EC2 Instance
        3. List of EC2 Instances
        4. Copy AMI from one region to another region
        -----------------------------------------------
        5. Delete Security Group
        6. Terminate EC2 Instance
        -----------------------------------------------
        0. Exit
    """

    read -p "Enter your choice: " choice 
    case $choice in
        1)
            create_security_group
        ;;
        2)
            create_ec2
        ;;
        3)
            list_of_ec2
        ;;
        4)
            copy_ami_to_another_region
        ;;
        5)
            delete_security_group
        ;;
        6)
            terminate_ec2
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
