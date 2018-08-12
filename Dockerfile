FROM python:3.7-alpine

RUN apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        docker \
        g++ \
        gcc \
        git \
        jq \
        libffi-dev \
        libressl-dev \
        linux-headers \
        make \
        musl-dev \
        ssh

RUN pip install --no-cache-dir azure-cli==2.0.43
