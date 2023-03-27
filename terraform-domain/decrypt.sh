#!/bin/bash

kubectl get service front-end -n sock-shop -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' > sock-shop.txt
kubectl get service voting-service -n voting-application -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' > voting-app.txt

cat sock-shop.txt
cat voting-app.txt
aws kms decrypt --ciphertext-blob sock-shop.txt --output text --query Plaintext | base64 --decode > decrypt-sock-shop.txt
aws kms decrypt --ciphertext-blob voting-app.txt --output text --query Plaintext | base64 --decode > decrypt-voting-app.txt

cat decrypt-sock-shop.txt
cat decrpyt-sock-shop.txt

# aws kms decrypt --ciphertext-blob fileb://encrypted_test_file --output text --query Plaintext | base64 --decode > decrypted_test_file.txt