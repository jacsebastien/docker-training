FROM node:6-alpine

RUN apk add --no-cache tini

# Create `/usr/src/app` directory and set it as working directory for further instructions 
WORKDIR /usr/src/app

COPY package.json package.json

# Run multiple commands one after the other in only one image layer
RUN npm install \
  && npm cache clean --force

COPY src .

EXPOSE 3000

# run command `/sbin/tini -- node ./bin/www` 
CMD ["/sbin/tini", "--", "node", "./bin/www"]