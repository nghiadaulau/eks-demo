# Kubernetes Deployment

Deploy the Flask application to Kubernetes cluster.

## Quick Start

```bash
kubectl apply -f deployment.yaml
```

## Check Deployment Status

```bash
kubectl get deployments
kubectl get pods
```

## Access the Application

```bash
kubectl port-forward deployment/flask-app-deployment 8080:8080
```

Then visit: http://localhost:8080
