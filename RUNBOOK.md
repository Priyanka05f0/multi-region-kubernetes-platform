# Operational Runbook

## Deployment

### Deploy Infrastructure

cd terraform  
terraform init  
terraform apply  

### Deploy Application

kubectl apply -f kubernetes/hello-app.yaml

### Deploy Database and Cache

kubectl apply -f database/postgres.yaml  
kubectl apply -f database/redis.yaml

### Deploy Monitoring

kubectl apply -f monitoring/grafana.yaml

---

## Verification

Check running pods:

kubectl get pods

Check services:

kubectl get svc

---

## Access Application

Get external IP:

kubectl get svc hello-app

Open in browser:

http://<external-ip>

---

## Access Grafana

kubectl get svc grafana

Open:

http://<grafana-ip>:3000

Login:

username: admin  
password: admin

---

## Troubleshooting

Describe pod:

kubectl describe pod <pod-name>

View logs:

kubectl logs <pod-name>

---

## Destroy Infrastructure

cd terraform  
terraform destroy