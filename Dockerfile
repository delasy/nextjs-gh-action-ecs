FROM node:20-alpine

ENV NODE_ENV production
EXPOSE 3000

WORKDIR /app
COPY . .
RUN npm pkg delete scripts.prepare && npm ci
RUN npm run build

ENV PORT 3000
CMD HOSTNAME="0.0.0.0" node server.js
