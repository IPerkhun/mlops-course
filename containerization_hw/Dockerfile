FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /build
WORKDIR /build


RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends curl wget build-essential unzip

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    git \
    python3-pip python3-dev

RUN wget https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.zip \
    && unzip boost_1_63_0.zip \
    && mv boost_1_63_0 /usr/local/bin \
    && rm boost_1_63_0.zip

RUN git clone https://github.com/facebookresearch/Starspace.git 
WORKDIR Starspace 
RUN make

CMD /build/Starspace/starspace train \
        -trainFile /data/${TRAIN_FILE_NAME} \
        -model  /data/${OOTPUT_FILE_NAME}