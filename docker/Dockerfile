FROM ubuntu:22.04


ARG DEBIAN_FRONTEND=noninteractive

ARG GDRIVE_SECRETS_ARG
ENV GDRIVE_SECRETS=$GDRIVE_SECRETS_ARG


RUN mkdir -p /build
WORKDIR /build

COPY . .

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends curl wget build-essential unzip iputils-ping gnupg2 

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends git \
    python3-pip python3-dev

RUN pip3 install "dvc[gdrive]"

RUN cd ./data_governance_testing \
    ls -al \
    pip3 install -r requirements.txt \ 
    && rm requirements.txt


RUN cd ./data_governance_testing \
    && chmod +x decrypt_secret.sh \
    && ./decrypt_secret.sh 


CMD ping 8.8.8.8