!#/bin/bash

IMAGENAME="wp-image"
CONTAINERNAME="wp-instace"


docker build -t "$IMAGENAME" .
docker run -it --name="$CONTAINERNAME" -p "80:80" "$IMAGENAME"

read -p "Delete instances and image(y/n)?" choice
if [ "$choice" == "y" ]; then
	docker rm "$CONTAINERNAME"
	docker rmi "$IMAGENAME"
fi

