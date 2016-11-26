FROM mhart/alpine-node:6.9.1

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

RUN apk add --no-cache make gcc g++

RUN npm install -g storjshare-cli

VOLUME ["/data"]

ENTRYPOINT ["storjshare"]