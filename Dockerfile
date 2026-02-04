FROM node:18-alpine

WORKDIR /myapp

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy source code
COPY . .

# Build the app (creates dist/)
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
