!#/bin/bash

IMAGENAME="nginx-image"
CONTAINERNAME="nginx-Instace"


docker build -t "$IMAGENAME" .
docker run -it --name="$CONTAINERNAME" -p "443:443" "$IMAGENAME"

read -p "Delete instances and image(y/n)?" choice
if [ "$choice" == "y" ]; then
	docker rm "$CONTAINERNAME"
	docker rmi "$IMAGENAME"
fi

