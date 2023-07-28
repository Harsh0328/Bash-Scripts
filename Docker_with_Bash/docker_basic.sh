!/bin/bash

function list_images() {
	docker images
}


function list_containers() {
	read -p ""y" to show all containers "n" to show running containers : " choice
	
	if [ $choice -eq "y" ]
		then docker ps -a
	elif [ $choice -eq "n" ]
		then docker ps
    else
        echo "Invalid Choice"
        continue
	fi
}


function build_image() {
    ls ~/Documents/aws/
    read -p "Enter folder name : " fname
    read -p "Enter image name : " iname
	docker build -t $iname ~/Documents/aws/$fname
}


function run_container() {
    read -p "Enter container name : " cname
    read -p "Enter port-binding : " pbind
    read -p "Enter image name : " iname
	docker run -itd --name $cname -p $pbind $iname
}


while :
do
    echo """
    1. List Images
    2. List Containers
    
    3. Build Docker Image
    4. Run Container
    0. Exit
    """

    read -p "Enter your choice : " choice 
    case $choice in
    	1)
    		list_images
    	;;
    	2)
    		list_containers
    	;;
    	3)
    		build_image
    	;;
    	4)
    		run_container
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
