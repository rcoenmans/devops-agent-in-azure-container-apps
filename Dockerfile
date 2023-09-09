FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV TARGETARCH=linux-x64

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \
    zip \
    unzip

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]