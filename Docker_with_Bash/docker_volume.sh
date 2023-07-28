!/bin/bash

function list_images() {
	docker image prune -a
}


function list_containers() {
    docker container prune 
}


function build_image() {
    docker system prune
}


#function run_container() {
#
#}


while :
do
    echo """
    1. Remove all Images
    2. Remove all Containers
    3. Clear System
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
    	0) 
            echo "Exiting"
            exit 0
        ;;
        *)
             echo "Invalid choice. Try again."
        ;;
    esac
done
