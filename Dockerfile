FROM node:13.14.0-stretch-slim
RUN mkdir /home/dvws-node
WORKDIR /home/dvws-node
RUN apt-get update && apt-get install -y git python3 build-essential --no-install-recommends
COPY . .
ENV NODE_TLS_REJECT_UNAUTHORIZED=0
RUN npm set strict-ssl false && npm install --build-from-source
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait
