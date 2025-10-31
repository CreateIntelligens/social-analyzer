FROM node:18.15.0-alpine3.17
WORKDIR /usr/src/app

# 安裝系統依賴
RUN apk update && \
  apk add --no-cache firefox-esr

# 複製 package files 並安裝依賴
COPY package*.json ./
RUN npm ci && \
  npm install lodash && \
  npm cache clean --force

EXPOSE 9005
ENTRYPOINT [ "npm", "start", "--","--gui", "--docker"]
