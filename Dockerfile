# Use slim instead of alpine (better compatibility in GKE)
FROM node:20.12-slim

WORKDIR /app

# Upgrade npm to patched version
RUN npm install -g npm@11.6.4

# Copy only package files first (better layer caching)
COPY package*.json ./

# Install only production deps
RUN npm install --omit=dev

# Copy source
COPY . .

# Expose app port
EXPOSE 3000

# Run app
CMD ["node", "index.js"]
