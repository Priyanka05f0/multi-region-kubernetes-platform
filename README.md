# Multi-Region Kubernetes Platform

## Project Overview
This project demonstrates a **highly available, multi-region cloud architecture** designed to host scalable microservices. The platform leverages **Infrastructure as Code (IaC)** and **GitOps** principles to ensure consistency, automation, and disaster recovery readiness across global regions.

**Student Name:** Lakshmi Priyanka B
**Student ID:** 23MH1A05F0

---

## Key Features
- **Multi-Region Resiliency**: Automated provisioning of Kubernetes clusters across multiple geographic regions using **Terraform**.
- **GitOps Automation**: Continuous Deployment and environment synchronization managed via **ArgoCD**.
- **Scalable Monitoring**: A federated observability stack using the **Prometheus Operator** and **Grafana**, optimized for stateless high availability.
- **Container Orchestration**: Production-grade microservices deployment including an application layer, **PostgreSQL** database, and **Redis** cache.

---

## Technology Stack
- **Infrastructure:** Terraform, Google Cloud Platform (GCP)
- **Orchestration:** Kubernetes (GKE), Docker
- **Observability:** Prometheus, Grafana, Helm
- **GitOps:** ArgoCD
- **Database/Cache:** PostgreSQL, Redis

---

## Project Structure
```text
multi-region-kubernetes-platform
│
├─ terraform/     # Infrastructure as Code (GCP Resources)
├─ kubernetes/    # Application Deployment Manifests
├─ database/      # PostgreSQL + Redis Configurations
├─ monitoring/    # Prometheus & Grafana Helm Configurations
├─ argocd/        # GitOps Application Manifests
└─ README.md      # Project Documentation
```
## Deployment & Infrastructure as Code
The platform is managed entirely through code to ensure reproducibility across regions.

### 1. Provision Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

### 2. Automated Monitoring (Helm)
The monitoring stack is deployed using Helm to manage complex dependencies. To resolve regional storage bottlenecks, the stack is configured with emptyDir memory storage for Prometheus, ensuring high availability without persistent disk dependencies.

```bash
./helm install prometheus prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.storageSpec.emptyDir.medium=Memory \
  --namespace default
  ```

### 3. GitOps Synchronization (ArgoCD)
The application manifests are automatically synced from this GitHub repository using ArgoCD to maintain environment parity.

```bash
kubectl apply -f argocd/application.yaml
```

## Observability & Verification
A centralized Grafana dashboard provides a "single pane of glass" view of the multi-region platform's health.

#### Accessing the Dashboard
#### 1. Retrieve Admin Password:
```bash
kubectl get secret prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d
```
#### 2. Establish Port-Forward:
```bash
kubectl port-forward svc/prometheus-grafana 3000:80
```
#### 3. Verify Metrics: Access 
```
http://localhost:3000
```
and view the "Kubernetes / Compute Resources / Multi-Cluster" dashboard to see cross-region data.

## Disaster Recovery & Resilience
- Stateless Observability: By utilizing memory-backed volumes (emptyDir), the monitoring stack can initialize instantly in any region during a disaster recovery event.

- Automated Healing: ArgoCD monitors for configuration drift and automatically resyncs the cluster to the desired state defined in Git.

## Video Demonstration
A detailed walkthrough of the platform, including the Prometheus storage resolution, ArgoCD sync, and live Grafana metrics, can be found here:
```https://drive.google.com/file/d/1ZMIe38R3OuVCA4kEKksKQvZisDO3mYYB/view?usp=sharing```