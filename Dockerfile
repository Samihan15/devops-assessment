FROM node:20.20.0-alpine

RUN npm install -g npm@latest

WORKDIR /myapp

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
