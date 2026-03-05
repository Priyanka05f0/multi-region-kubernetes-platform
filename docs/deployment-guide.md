# Deployment Guide

## Prerequisites

- Google Cloud account
- Terraform installed
- kubectl installed
- Docker installed

## Steps

### 1 Clone Repository

git clone <repository-url>

### 2 Deploy Infrastructure

cd terraform  
terraform init  
terraform apply

### 3 Deploy Application

kubectl apply -f kubernetes/

### 4 Deploy Database and Cache

kubectl apply -f database/

### 5 Deploy Monitoring

kubectl apply -f monitoring/

## Verification

kubectl get pods  
kubectl get svc