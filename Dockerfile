FROM node:15-buster-slim
WORKDIR /usr/src/app
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY package*.json ./
RUN npm ci --production

COPY ./src .
EXPOSE 3000

ENTRYPOINT ["/tini", "--"]
CMD ["node", "index"]

USER node