# System Architecture

## Overview

This platform implements a **multi-region Kubernetes architecture** designed for high availability and resilience.

The system distributes workloads across multiple regions while maintaining centralized observability and scalable infrastructure.

---

## Architecture Diagram
```
            Users
              |
              v
      Global Load Balancer
              |
    ------------------------
    |                      |
    v                      v

    Kubernetes Cluster Kubernetes Cluster
Region A Region B
| |
v v
Hello App Pods Hello App Pods
| |
--------Database & Cache---------
|
PostgreSQL + Redis
|
Monitoring
|
Grafana
```

---

## Architecture Components

### 1 Infrastructure Layer

Infrastructure resources are provisioned using **Terraform**, including:

- Kubernetes clusters
- networking configuration
- resource provisioning

---

### 2 Application Layer

The application is deployed using Kubernetes deployments.

Features:

- containerized microservice
- horizontally scalable pods
- exposed through LoadBalancer service

---

### 3 Data Layer

PostgreSQL stores application data.

Redis provides caching to reduce database load.

---

### 4 Observability Layer

Grafana provides monitoring dashboards for:

- cluster health
- pod metrics
- service performance

---

## Multi-Region Strategy

The infrastructure spans multiple regions to improve:

- availability
- latency
- resilience

Traffic can be routed to the nearest healthy region.

---

## Trade-Offs

Advantages:

- high availability
- scalability
- infrastructure automation

Challenges:

- cross-region data consistency
- increased infrastructure complexity
- monitoring requirements