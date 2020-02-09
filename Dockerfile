FROM python:3.8-alpine

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
        openssh-client \
        openssl

ARG AZURE_CLI_VERSION=2.0.79
RUN pip install --no-cache-dir azure-cli==$AZURE_CLI_VERSION

ADD https://storage.googleapis.com/kubernetes-release/release/stable.txt /dev/null
RUN curl -L -o /usr/local/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

ARG HELM_VERSION=v3.0.2
RUN curl -Lo helm.tar.gz https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz && \
    tar zxvf helm.tar.gz && mv linux-amd64/helm /usr/local/bin && \
    rm helm.tar.gz && rm -rf linux-amd64

ARG SKAFFOLD_VERSION=v1.3.1
RUN curl -Lo skaffold https://github.com/GoogleContainerTools/skaffold/releases/download/$SKAFFOLD_VERSION/skaffold-linux-amd64 && \
    chmod +x skaffold && mv skaffold /usr/local/bin

ARG KUSTOMIZE_VERSION=v3.5.4
RUN curl -Lo kustomize.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/$KUSTOMIZE_VERSION/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz && \
    tar zxvf kustomize.tar.gz && mv kustomize /usr/local/bin && rm kustomize.tar.gz
