FROM alpine:3.23

COPY ./tools/ .

RUN apk add --no-cache bash

SHELL ["/bin/bash", "-c"]

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]
