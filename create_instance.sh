!/bin/bash
function create_security_group() {
	read -p "Enter Security Group Name : " group_name
	read -p "Enter description : " description
	read -p "Enter VPC ID : " vpc_id
	GroupID=$(aws ec2 create-security-group --group-name $group_name --description "$description" --vpc-id $vpc_id | jq -r '.GroupId')

	if [ $? -eq 0 ]
		then echo "Successfully created Security Group"
	else
		echo "Failed to create Security Group"
	fi

	echo "GroupID=$GroupID" 
}


function create_ec2() {
	read -p "Enter Image ID : " ImageID
	read -p "Enter instance type : " ec2type
	read -p "Enter Security Key : " sec_key
	read -p "Enter Security Group : " $GroupID
	InstanceID=$(aws ec2 run-instances --image-id $ImageID --count 1 --instance-type $ec2type --key-name $sec_key --security-group-ids $GroupID | jq -r '.Instances[0].InstanceId')

	echo "InstanceID is : $InstanceID"
}


function list_of_ec2() {
	#echo $(aws ec2 describe-instances)
	InstanceID=$(aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId')
	echo "InstanceID is : $InstanceID"
}


function copy_ami_to_another_region() {
	read -p "Enter New Region : " region
	read -p "Enter Name : " name
	read -p "Enter Source Region : " src_region
	read -p "Enter Source ImageId : " ImageId

	aws ec2 copy-image \
    --region $region \
    --name $name \
    --source-region $src_region \
    --source-image-id $ImageId \
    --description "This is my copied image."
    --copy-image-tags
}

echo """
	1. create security group
	2. create ec2 instance
	-----------------------------------------------
	3. list of ec2 instances
	4. copy ami from one region to another region
"""

read -p "Enter your choice : " choice 
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
	0) 
        echo "Exiting"
        exit 0
    ;;
    *)
         echo "Invalid choice. Try again."
    ;;
esac