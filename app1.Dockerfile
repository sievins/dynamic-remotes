FROM node:latest

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "yarn.lock", "./"]
COPY ["app1/package.json", "./app1/"]

RUN yarn install --production=false

COPY . ./

RUN yarn workspace @dynamic-remotes/app1 run build

EXPOSE 3001

CMD ["yarn", "workspace", "@dynamic-remotes/app1", "run", "serve"]
