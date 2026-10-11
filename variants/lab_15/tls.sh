#!/usr/bin/env bash
set -e

mkdir -p certs

openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 \
    -nodes \
    -keyout certs/video.key \
    -out certs/video.crt \
    -days 180 \
    -subj "/CN=*.lab.test" \
    -addext "subjectAltName=DNS:*.lab.test,DNS:lab.test"

chmod 600 certs/video.key