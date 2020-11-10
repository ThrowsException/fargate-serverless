FROM node:14-stretch-slim
WORKDIR /
COPY . /
RUN npm ci
EXPOSE 3000
CMD ["node", "index"]