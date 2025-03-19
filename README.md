# Solaborate Assignment

**This assignment includes setting up a web application (I used Flask), deploy it to AKS, also configure monitoring with Grafana, retreiving Azure quota limits, and also perform some file operations.**

## 1. Dockerizing the Flask Web App

- A Dockerfile was created to containerize the Flask app.
- The image was built and pushed to Docker Hub.
- Commands used:
```
docker build -t webapp .
docker tag flask-app grannitb/flask-app
docker push grannitb/flask-app
```

## 2. Setting Up AKS with Terraform

- Terraform was used to create a resource group, AKS cluster, virtual network, and blob storage for the remote state.
- The following commands were used:
```
terraform fmt
terraform init
terraform plan
terraform apply
```
## 3. Deploying the Flask App on AKS

- Kubernetes manifests were created for deployment and service.

- Applied the manifests with:
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
- Verified services with:
```
kubectl get pods
kubectl get services
```

## 4. Monitoring with Grafana and Prometheus

- Grafana was deployed with persistent storage and exposed using a LoadBalancer.
- The external IP was used to access the Grafana UI.
- Prometheus was deployed with proper role-based access and configured to scrape AKS metrics.

## 5. Azure Quota API

- A script was written in Bash to retrieve vCPU and networking quota limits.
- The script runs with:
```
./quota_api.sh (file located under assignment_4)
```
## 6. File Operations

- A script was created in Bash and Python to write text to a file, copy the content, count dots and lines, and extract words starting with "file".
- The scripts run with:
```
./file_operations.sh (file located under assignment_4)
```

## 7. Kubernetes CronJob

- A CronJob was created to print the current time every hour.
- The YAML configuration was applied with
```
kubectl apply -f cronjob.yaml
```
**This project successfully deploys a Flask web application on Azure AKS, automates infrastructure with Terraform, integrates monitoring with Grafana and Prometheus, retrieves Azure Quota API limits, and performs file operations using Bash.**