# Architecture Design

## System Architecture

The platform uses a **multi-region Kubernetes architecture** deployed on Google Cloud.

## Components

### Infrastructure Layer
Terraform provisions Kubernetes clusters across regions.

### Application Layer
Hello App is deployed as a Kubernetes Deployment and exposed using a LoadBalancer service.

### Database Layer
PostgreSQL runs inside Kubernetes to store application data.

### Cache Layer
Redis provides caching for faster data access.

### Observability Layer
Grafana is used for monitoring system metrics and visualization.

## Architecture Flow

User  
↓  
LoadBalancer Service  
↓  
Kubernetes Cluster  
↓  
Hello App Pods  
↓  
PostgreSQL Database  
Redis Cache  
↓  
Grafana Monitoring

## Multi-Region Strategy

Clusters are deployed in multiple regions to provide:

- High availability
- Fault tolerance
- Reduced latency

Traffic can be routed to the nearest available region.

## Infrastructure as Code

Terraform is used to automate:

- Cluster creation
- Networking configuration
- Resource provisioning