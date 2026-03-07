FROM alpine:3.23

COPY ./tools/ .

RUN apk add --no-cache bash &&\
	apk add nginx  &&\
	apk add openrc && \
	apk add openssl

SHELL ["/bin/bash", "-c"]

RUN chmod +x init.sh

EXPOSE 443

ENTRYPOINT ["./init.sh"]
