FROM python:3.7-alpine

RUN apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        docker \
        gettext \
        g++ \
        gcc \
        git \
        jq \
        libffi-dev \
        libressl-dev \
        linux-headers \
        make \
        musl-dev \
        openssh-client

RUN pip install --no-cache-dir azure-cli==2.0.60

ADD https://storage.googleapis.com/kubernetes-release/release/stable.txt /dev/null
RUN curl -L -o /usr/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl
