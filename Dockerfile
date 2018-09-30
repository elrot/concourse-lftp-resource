FROM alpine:3.8

RUN apk add --no-cache jq lftp openssh

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
