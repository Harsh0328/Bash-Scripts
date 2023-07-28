!/bin/bash
function imdel() {
    docker images
    read -p "Enter Image name " imgid
	docker rmi $imgid --force
}


function contdel() {
    docker ps -a
    read -p "Enter Container id " conid
    docker rm $conid
}


function voldel() {
    docker volume ls
    read -p "Enter Volume name " volname
    docker volume rm $volname
}

function imgprune() {
	docker image prune -a
}


function conprune() {
    docker container prune 
}


function sysprune() {
    docker system prune
}

function volprune() {
    docker volume prune -a
}


while :
do
    echo """
    1. Delete Image
    2. Delete Container
    3. Delete Volume
    4. Remove all Images
    5. Remove all Containers
    6. Clear System
    7. Remove all Volumes
    8. Remove ALL
    0. Exit
    """

    read -p "Enter your choice : " choice 
    case $choice in
        1)
            imdel
        ;;
        2)
            contdel
        ;;
        3)
            voldel
        ;;
    	4)
    		imgprune
    	;;
    	5)
    		conprune
    	;;
    	6)
    		sysprune
    	;;
        7)
            volprune
        ;;
        8)
            imgprune
            conprune
            sysprune
            volprune
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
