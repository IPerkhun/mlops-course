#!/bin/bash
dvc init --no-scm -f

dvc remote add -d storage gdrive://1_mmw4Hh2QEhddm3ePSFRgGyg9JCO_4vo
dvc remote modify storage gdrive_use_service_account true
dvc remote modify storage gdrive_service_account_json_file_path ./secrets/gdrive-mlops-course-secrets.json

dvc run -n train_data \
-d service/train.py \
-o outputs/feature_importance.png \
-M outputs/metrics.json \
--no-exec python3 service/train.py

dvc repro

rm -rf ./secrets