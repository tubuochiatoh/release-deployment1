# Karpenter Deployment (Part 2)

This repository contains Karpenter deployment for the EKS cluster created in Part 1.

## 🔗 Infrastructure Link

This repo connects to:
- EKS Cluster: finishline-eks
- Created in: finishline-infra repo

## 📦 Components

- EC2NodeClass (Bottlerocket)
- NodePool (t3a only)
- Test workload (inflate)

## 🚀 Deployment Steps

```bash
cd karpenter
chmod +x install.sh
./install.sh