#!/usr/bin/env bash
set -euo pipefail

K8S_DIR="./k8s/base"

echo "[INFO] Applying Kubernetes manifests from $K8S_DIR"
kubectl apply -f "$K8S_DIR"

echo "[INFO] Waiting for deployment rollout..."
kubectl rollout status deployment/task-api
