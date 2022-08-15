FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /build
WORKDIR /build

COPY . .

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends curl wget build-essential unzip iputils-ping gnupg2 

ARG GDRIVE_SECRETS_ARG
ENV GDRIVE_SECRETS=$GDRIVE_SECRETS_ARG

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends git \
    python3-pip python3-dev

RUN pip3 install "dvc[gdrive]"


COPY requirements.txt .
RUN pip3 install -r requirements.txt \ 
    && rm requirements.txt

RUN chmod +x ./decrypt_secret.sh && ./decrypt_secret.sh 

RUN dvc init --no-scm -f

RUN dvc remote add -d storage gdrive://1_mmw4Hh2QEhddm3ePSFRgGyg9JCO_4vo
RUN dvc remote modify storage gdrive_use_service_account true
RUN dvc remote modify storage gdrive_service_account_json_file_path $PWD/secrets/gdrive-mlops-course-secrets.json

RUN dvc pull

RUN python3 train.py
