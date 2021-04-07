FROM node

RUN \
    mkdir -p /application

COPY package*.json /application/

ENV APP_NAME=$APP_NAME
ENV APP_PORT=$APP_PORT
ENV TEST=test

WORKDIR /application/

RUN \
    npm install

COPY . .

ARG BUILD_NUMBER
RUN \
    sed -i "s#_RUN_VERSION__#${BUILD_NUMBER}#g" server.config.js && \
    npm run build

EXPOSE 3030

CMD ["npm", "run", "prod"]
