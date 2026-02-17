# ---------- Stage 1: Builder ----------
FROM node:22-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/nodejs22-debian12

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["index.js"]
