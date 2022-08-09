FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /build
WORKDIR /build

COPY ${PWd}/main.py  . 
COPY ${PWD}/ai_service .

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends curl wget build-essential unzip iputils-ping

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends git \
    python3-pip python3-dev

COPY ${PWD}/requirements.txt .
RUN pip install --upgrade pip -f requirements.txt \ 
    && rm requirements.txt

CMD ["/bin/ping", "localhost"]
