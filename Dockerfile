FROM node:20-alpine

WORKDIR /app
COPY . .
RUN npm pkg delete scripts.prepare && npm install
ENV NODE_ENV production
RUN npm run build

EXPOSE 3000
ENV PORT 3000
CMD HOSTNAME="0.0.0.0" node server.js
