# Multi-Region Kubernetes Platform

## Overview
This project demonstrates a **multi-region cloud infrastructure deployment** using Terraform and Kubernetes.

The platform deploys an application across multiple regions with database, caching, and monitoring components.

## Architecture Components

- Kubernetes clusters deployed using Terraform
- Application deployed using Kubernetes manifests
- PostgreSQL database for persistent storage
- Redis for caching
- Grafana for monitoring and observability

## Project Structure
```
multi-region-kubernetes-platform
│
├ terraform/        # Infrastructure as Code
├ kubernetes/       # Application manifests
├ database/         # PostgreSQL and Redis
├ monitoring/       # Grafana monitoring
├ argocd/           # GitOps configuration
├ scripts/          # Deployment scripts
├ docs/             # Documentation files
│
├ README.md
├ ARCHITECTURE.md
├ RUNBOOK.md
└ submission.yml
```
## Deployment Steps

### Initialize Terraform
```bash
cd terraform  
```
```bash
terraform init
```
```bash  
terraform apply  
```
### Deploy Application
```bash
kubectl apply -f kubernetes/hello-app.yaml
```
### Deploy Database and Cache
```bash
kubectl apply -f database/postgres.yaml  
kubectl apply -f database/redis.yaml
```
### Deploy Monitoring
```bash
kubectl apply -f monitoring/grafana.yaml
```
## Verification
```bash
kubectl get pods  
kubectl get svc
```
## Monitoring Dashboard

Grafana is accessible through the LoadBalancer service.
```
http://<grafana-external-ip>:3000
```
Login:
```
username: admin  
password: admin
```