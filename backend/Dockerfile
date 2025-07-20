# Dockerfile for Node.js backend application
# syntax=docker/dockerfile:1.7

###
# Stage 1: dependencies
###
FROM node:lts-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

###
# Stage 2: test (optional; fails build if tests fail)
###
FROM deps AS test
COPY . .
ENV CI=true
RUN npm test

###
# Stage 3: production deps (prunes dev dependencies)
###
FROM deps AS prod-deps
RUN npm prune --omit=dev

###
# Stage 4: runtime
###
FROM node:lts-alpine AS runtime
ENV NODE_ENV=production
WORKDIR /app
# Only copy pruned node_modules + source
COPY --from=prod-deps /app/node_modules ./node_modules
COPY . .

HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -q -O /dev/null http://127.0.0.1:5000/health || exit 1

USER node
EXPOSE 5000
CMD ["node","index.js"]