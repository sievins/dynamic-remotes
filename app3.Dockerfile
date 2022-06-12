FROM node:latest

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "yarn.lock", "./"]
COPY ["app3/package.json", "./app3/"]

RUN yarn install --production=false

COPY . ./

RUN yarn workspace @dynamic-remotes/app3 run build

EXPOSE 3003

CMD ["yarn", "workspace", "@dynamic-remotes/app3", "run", "serve"]
