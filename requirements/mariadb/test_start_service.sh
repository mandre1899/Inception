!#/bin/bash

IMAGENAME="mariadb-image"
CONTAINERNAME="mariadb-instace"


docker build -t "$IMAGENAME" .
docker run -it --name="$CONTAINERNAME" "$IMAGENAME"

read -p "Delete instances and image(y/n)?" choice
if [ "$choice" == "y" ]; then
	docker rm "$CONTAINERNAME"
	docker rmi "$IMAGENAME"
fi
