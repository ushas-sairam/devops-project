#!/usr/bin/env bash
set -euo pipefail

# Variables
IMAGE_REPO="your-dockerhub-username/devops-project"
TAG=$(git rev-parse --short HEAD)   # use git commit hash as tag
FULL_IMAGE="$IMAGE_REPO:$TAG"

echo "[INFO] Building Docker image: $FULL_IMAGE"
docker build -t "$FULL_IMAGE" ./app

echo "[INFO] Pushing image to registry..."
docker push "$FULL_IMAGE"

echo "[INFO] Image pushed successfully!"
echo "Use this image in Kubernetes: $FULL_IMAGE"
