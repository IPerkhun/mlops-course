FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /build
WORKDIR /build

COPY volume .

RUN apt-key del 7fa2af80 && \
    apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends curl wget build-essential 

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    git \
    python3-pip python3-dev

RUN wget https://dl.bintray.com/boostorg/release/1.63.0/source/boost_1_63_0.zip \
    unzip boost_1_63_0.zip \
    mv boost_1_63_0 /usr/local/bin

RUN git clone https://github.com/facebookresearch/Starspace.git \
    cd Starspace \
    make

CMD ./starspace train -trainFile /build/volume/starspace_input_file.txt -model modelSaveFile