docker build --file=./docker/Dockerfile \
--progress=plain --tag=mlops_course:hw-3 \ 
--build-arg GDRIVE_SECRETS_ARG="perkhun" . 

cd docker \

docker-compose run main bash \

dvc run -n train_data \
-d service/train.py \
-o outputs/feature_importance.png \
-M outputs/metrics.json \
--no-exec python3 service/train.py



dvc init --no-scm -f

dvc remote add -d storage gdrive://1_mmw4Hh2QEhddm3ePSFRgGyg9JCO_4vo
dvc remote modify storage gdrive_use_service_account true
dvc remote modify storage gdrive_service_account_json_file_path $PWD/secrets/gdrive-mlops-course-secrets.json


RUN cd ./data_governance_testing \
#     && chmod +x decrypt_secret.sh \
#     && decrypt_secret.sh 



#!/bin/bash
dvc init --no-scm -f

dvc remote add -d storage gdrive://1_mmw4Hh2QEhddm3ePSFRgGyg9JCO_4vo
dvc remote modify storage gdrive_use_service_account true
dvc remote modify storage gdrive_service_account_json_file_path ./secrets/gdrive-mlops-course-secrets.json

rm -rf ./secrets