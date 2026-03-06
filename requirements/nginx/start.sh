!#bin/bash

docker build -t test .
docker run --name=test -p 80:80 test:latest
