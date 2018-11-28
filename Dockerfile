FROM node:8.13.0-alpine

RUN npm install -g yarn@1.12.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn --frozen-lockfile

COPY . .

ENV PATH ./node_modules/.bin:$PATH

RUN yarn build

CMD [ "yarn", "start" ]
