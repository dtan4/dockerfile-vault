FROM ubuntu:14.04
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

ENV VAULT_VERSION 0.4.0

RUN apt-get update && \
    apt-get install -y \
      libcurl4-openssl-dev \
      git \
      unzip \
      curl && \
    mkdir -p /tmp/vault && \
    cd /tmp/vault && \
    curl -L https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip > \
      vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
    mv vault* /usr/local/bin/ && \
    rm -rf /tmp/vault && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/vault"]
WORKDIR /vault

CMD ["vault", "version"]
