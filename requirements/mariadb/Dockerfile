FROM alpine:3.23

COPY ./tools/ .

RUN apk add --no-cache bash &&\
	apk add mariadb mariadb-client &&\
	apk add openrc

SHELL ["/bin/bash", "-c"]

RUN chmod +x init.sh

EXPOSE 3306

ENTRYPOINT ["./init.sh"]
