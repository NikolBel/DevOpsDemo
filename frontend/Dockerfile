# Use the official Node.js image as a base


# Dockerfile for Node.js frontend application
# syntax=docker/dockerfile:1.7

###
# Stage 1: dependencies
###
FROM node:lts-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

###
# Stage 2: build
###
FROM deps AS build
COPY . .
RUN npm run build

###
# Serve static via nginx
###
FROM nginx:alpine AS runtime
# Copy build to nginx html root
COPY --from=build /app/build /usr/share/nginx/html
# Provide simple health endpoint
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O /dev/null http://localhost/ || exit 1
EXPOSE 80
# (Nginx default CMD)