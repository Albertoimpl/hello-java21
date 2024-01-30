FROM ubuntu:mantic

ARG DOCKER_CE="5:24.0.7-1~ubuntu.23.10~mantic"

RUN apt-get -qy update \
    && apt-get -qy --no-install-recommends install \
	  apt-transport-https \
	  ca-certificates \
	  curl \
	  gnupg-agent \
	  software-properties-common \
    && apt-get clean

RUN mkdir -p /etc/apt/keyrings
RUN curl -L 'https://cli.github.com/packages/githubcli-archive-keyring.gpg' | gpg --dearmor -o /etc/apt/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list

RUN curl -q 'https://download.docker.com/linux/ubuntu/gpg' | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    	bsdextrautils \
    	containerd.io \
    	cgroupfs-mount \
    	docker-ce=${DOCKER_CE} \
    	gh \
    	git \
    	jq \
    	net-tools \
    	uuid-runtime \
    	openjdk-21-jdk-headless && \
    apt-get clean

RUN apt install nodejs -y && \
    apt install npm -y

COPY . /workspace