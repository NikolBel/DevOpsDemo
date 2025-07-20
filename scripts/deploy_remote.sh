#!/usr/bin/env bash
set -euo pipefail

BACKEND_TAG="${BACKEND_TAG:-latest}"
FRONTEND_TAG="${FRONTEND_TAG:-latest}"

cd "$(dirname "$0")/../compose"

cat > .env <<EOF
BACKEND_TAG=$BACKEND_TAG
FRONTEND_TAG=$FRONTEND_TAG
EOF

docker compose -f docker-compose.base.yml -f docker-compose.prod.yml pull
docker compose -f docker-compose.base.yml -f docker-compose.prod.yml up -d --remove-orphans
docker image prune -f --filter "dangling=true"
