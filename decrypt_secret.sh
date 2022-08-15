#!/bin/bash

# Decrypt the file
mkdir $HOME/secrets

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$GDRIVE_SECRETS" \
--output $HOME/secrets/gdrive-mlops-course-secrets.json gdrive-mlops-course-secrets.json.gpg

