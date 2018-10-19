FROM jenkins/jnlp-slave:alpine
WORKDIR /usr/local/bin
LABEL maintainer Matt Sauce <matthieu.sauce@gmail.com 

ENV KUBECTL_VERSION=v1.12 HELM_VERSION=v2.9.1

USER root
RUN apk add --no-cache make \
    ca-certificates \
    bash \
    curl \
    git

#Kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl

RUN curl -o helm.tar https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz && \
    tar xvf helm.tar && \
    cp linux-amd64/helm /usr/local/bin/
USER jenkins
