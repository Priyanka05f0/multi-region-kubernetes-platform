# Multi-Region Kubernetes Platform

## Project Overview

This project demonstrates a **multi-region cloud architecture** deployed using Terraform and Kubernetes.

The platform deploys a containerized application across multiple regions with supporting services including:

- PostgreSQL database
- Redis cache
- Monitoring with Grafana

The objective is to build a **highly available and scalable infrastructure** capable of surviving regional failures.

---

## Key Features

- Infrastructure provisioning using Terraform
- Multi-region Kubernetes deployment
- Containerized microservice architecture
- Database and caching layer
- Observability stack
- Automated deployment scripts

---

## Technology Stack

Infrastructure:
- Terraform
- Google Cloud Platform

Container Platform:
- Kubernetes
- Docker

Data Layer:
- PostgreSQL
- Redis

Monitoring:
- Grafana

---

## Project Structure
```
multi-region-kubernetes-platform
│
├ terraform/ Infrastructure as Code
├ kubernetes/ Application manifests
├ database/ PostgreSQL + Redis
├ monitoring/ Grafana monitoring
├ argocd/ GitOps configuration
├ scripts/ Automation scripts
├ docs/ Additional documentation
│
├ README.md
├ ARCHITECTURE.md
├ RUNBOOK.md
└ submission.yml
```

---

## Deployment

Deploy infrastructure:
```bash
cd terraform
terraform init
terraform apply
```

### Deploy application:
```bash
kubectl apply -f kubernetes/
```
### Deploy database and cache:
```bash
kubectl apply -f database/
```
### Deploy monitoring:
```bash
kubectl apply -f monitoring/
```

---

## Verification
```bash
kubectl get pods
kubectl get svc
```

---

## Access Application
```bash
kubectl get svc hello-app
```

Open the external IP in browser.

---

## Monitoring Dashboard

Grafana dashboard:
```
http://<grafana-ip>:3000
```

Login credentials:
```
username: admin
password: admin
```