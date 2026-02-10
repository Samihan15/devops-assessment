FROM node:20.20.0-alpine

RUN npm install -g npm@11.6.4

WORKDIR /myapp

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
