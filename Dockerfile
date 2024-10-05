FROM node:22-alpine

WORKDIR /app
RUN apk add --no-cache \
    git \
    bash

COPY *.json yarn.lock ./
RUN yarn install

COPY /src ./src
COPY /public ./public

# Building
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN yarn build

RUN yarn global add serve

EXPOSE 3000

CMD ["serve", "-d", "build", "-l", "3000"]
