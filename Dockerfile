FROM node:7-onbuild

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ADD main.js ./

ADD index.html ./

ADD package.json ./

RUN npm install -g heroku

RUN npm install

USER root

CMD ["npm", "start"]



