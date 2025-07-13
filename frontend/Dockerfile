# Dockerfile for Node.js frontend application
# Use the official Node.js image as a base
FROM node:lts-alpine

# Set production mode and working directory
ENV NODE_ENV=production
WORKDIR /usr/src/app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install --loglevel verbose

# Copy the application code source
COPY . .

# Expose the port your app listens on
EXPOSE 3000

# Adjust permissions and switch to non-root user
RUN chown -R node:node /usr/src/app
USER node

# Start the application
CMD ["npm", "start"]