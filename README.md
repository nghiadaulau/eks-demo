# EKS Demo Project

Demo project deploying a Flask application on Amazon EKS with Karpenter auto-scaling.

## 📁 Project Structure

```
eks-demo/
├── 🐳 [image/](image/)                   # Containerized Flask Application  
├── 📦 [terraform/](terraform/)           # Infrastructure as Code
├── 📊 [chart/](chart/)                   # Helm Charts (Karpenter)
└── ⚙️ [deployment/](deployment/)         # Kubernetes Deployment
```

## 🚀 Deployment Order

1. **Build & Push Image** - [image/](image/)
2. **Deploy Infrastructure** - [terraform/](terraform/)
3. **Install Karpenter Controller** - [chart/karpenter/karpenter-controller/](chart/karpenter/karpenter-controller/)
4. **Apply EC2 Class & NodePool Manifests** - [chart/karpenter/manifest/](chart/karpenter/manifest/)
5. **Deploy Application** - [deployment/](deployment/)

## 📚 Documentation

- [Application Development Guide](image/README.md) 
- [Terraform Infrastructure Guide](terraform/README.md)
- [Karpenter Controller Guide](chart/karpenter/karpenter-controller/README.md)
- [Karpenter Manifests Guide](chart/karpenter/manifest/README.md)
- [Kubernetes Deployment Guide](deployment/README.md)
