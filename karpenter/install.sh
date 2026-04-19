#!/bin/bash

# Connect to EKS cluster (Part 1 infra)
aws eks update-kubeconfig --name finishline-eks --region us-east-1

# Install Karpenter
helm repo add karpenter https://charts.karpenter.sh
helm repo update

helm install karpenter-crd karpenter/karpenter-crd \
  --namespace kube-system

helm install karpenter karpenter/karpenter \
  --namespace kube-system \
  --set serviceAccount.name=karpenter \
  --set settings.clusterName=finishline-eks \
  --set settings.aws.defaultInstanceProfile=finishline-eks-node-role

# Apply manifests
kubectl apply -f ec2nodeclass.yaml
kubectl apply -f nodepool.yaml

# Deploy test workload
kubectl apply -f inflate.yaml