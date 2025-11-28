ARG NODE_VERSION=24

FROM node:${NODE_VERSION}-alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# ---

FROM node:${NODE_VERSION}-alpine AS runner

WORKDIR /app

ENV PORT=3000

COPY --from=builder /app .

EXPOSE 3000

HEALTHCHECK --interval=30s CMD wget --spider -q http://localhost:${PORT} || exit 1

LABEL maintainer="CodiArqui"

CMD ["npm", "start"]