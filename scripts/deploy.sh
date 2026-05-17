#!/bin/bash

# Connect to EKS
aws eks update-kubeconfig \
  --region us-east-2 \
  --name my-eks-cluster

# Deploy to EKS
kubectl apply -f Deployment.yaml \
  --namespace=default

# Verify deployment
kubectl rollout status \
  deployment/pipeline \
  --namespace=default \
  --timeout=120s

echo "Deployed successfully ✅"
