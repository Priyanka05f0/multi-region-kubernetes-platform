# Operational Runbook

This document describes operational procedures for maintaining the Multi-Region Kubernetes Platform.

---

# Deployment

### 1. Infrastructure Provisioning
```bash
cd terraform
terraform init
terraform apply
```
### 2. Monitoring & Observability (Helm)
The monitoring stack must be deployed via Helm to handle the Prometheus Operator logic.
```bash
./helm install prometheus prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.storageSpec.emptyDir.medium=Memory \
  --namespace default
  ```

### 3. Application & GitOps
Deploy the ArgoCD manifest to automate the remaining services (hello-app, postgres, redis).
```bash
kubectl apply -f argocd/application.yaml
```

### Verification
Check Health Status
```bash
```bash
# Verify all pods are Running and Ready (e.g., 2/2 or 3/3)
kubectl get pods

# Verify internal/external connectivity
kubectl get svc
```

### Access Monitoring
```bash
# Retrieve Grafana admin password
kubectl get secret prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo
```
```bash
# Port-forward to local machine
kubectl port-forward svc/prometheus-grafana 3000:80
```

### Disaster Recovery
Scenario: Prometheus Pod stuck in "Pending" or "CrashLoop"
Cause: Persistent Volume Claim (PVC) failure in a specific region.
Resolution:
1.Verify storage errors:
```bash 
kubectl describe pod <prometheus-pod-name>
```

2.Force delete the stuck pod:
 ```bash
kubectl delete pod <pod-name> --force
```
3.Re-apply Helm configuration with emptyDir memory storage:
```bash
./helm upgrade prometheus prometheus-community/kube-prometheus-stack --set prometheus.prometheusSpec.storageSpec.emptyDir.medium=Memory
```

### Regional Failure Scenario
In the event of a total regional blackout:
1. Detection: The Centralized Grafana Dashboard will show "No Data" or a drop in the up metric for the affected region.

2. Traffic Management: The Load Balancer automatically redirects traffic to the healthy regional clusters.

3. Recovery: Once the cloud provider restores the region, use Terraform to re-sync any lost infrastructure:
```bash
cd terraform && terraform apply
```

4. Synchronization: ArgoCD will automatically detect the new cluster and redeploy all applications.

### Cleanup
To completely decommission the platform and avoid costs:

```bash
# Uninstall monitoring first
./helm uninstall prometheus

# Destroy cloud resources
cd terraform
terraform destroy
```
---