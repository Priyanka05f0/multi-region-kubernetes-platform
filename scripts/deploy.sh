#!/bin/bash

echo "Starting deployment..."

cd terraform
terraform init
terraform apply -auto-approve

cd ..

kubectl apply -f kubernetes/
kubectl apply -f database/
kubectl apply -f monitoring/

echo "Deployment completed"