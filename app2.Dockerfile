FROM node:latest

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "yarn.lock", "./"]
COPY ["app2/package.json", "./app2/"]

RUN yarn install --production=false

COPY . ./

RUN yarn workspace @dynamic-remotes/app2 run build

EXPOSE 3002

CMD ["yarn", "workspace", "@dynamic-remotes/app2", "run", "serve"]
