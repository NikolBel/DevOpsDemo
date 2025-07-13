#!/usr/bin/env bash
# ----------------------------------------------------------------------------
# Build & Push FE + BE images to Docker Hub
# Usage: ./push-images.sh <dockerhub-username>
# ----------------------------------------------------------------------------

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <your-dockerhub-username>"
  exit 1
fi

USER="$1"
BE_IMG_LOCAL="devopsdemo-backend:local"
FE_IMG_LOCAL="devopsdemo-frontend:local"
BE_IMG_REMOTE="$USER/devopsdemo-backend:latest"
FE_IMG_REMOTE="$USER/devopsdemo-frontend:latest"

# Build images locally
docker build -t $BE_IMG_LOCAL ./backend
docker build -t $FE_IMG_LOCAL ./frontend

# Tag for Docker Hub
docker tag $BE_IMG_LOCAL $BE_IMG_REMOTE
docker tag $FE_IMG_LOCAL $FE_IMG_REMOTE

# Push
docker push $BE_IMG_REMOTE
docker push $FE_IMG_REMOTE

echo "Images pushed:"
echo "$BE_IMG_REMOTE"
echo "$FE_IMG_REMOTE"