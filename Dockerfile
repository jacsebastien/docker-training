FROM node:6-alpine

RUN apk add --no-cache tini

WORKDIR /usr/src/app

COPY package.json package.json

RUN npm install \
    && npm cache clean --force

COPY src .

EXPOSE 3000

CMD ["/sbin/tini", "--", "node", "./bin/www"]