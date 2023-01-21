FROM node:16.13.0

ARG MACHINE_NAME={{app_name}}
ENV MACHINE_NAME={{app_name}}

WORKDIR /usr/src/{{app_name}}

#install app dependecies
COPY package*.json ./

RUN npm install
RUN npm install pm2 -g

COPY . .
EXPOSE 3000

CMD pm2-runtime index.js --machine-name $MACHINE_NAME
