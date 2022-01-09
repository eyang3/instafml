FROM node:14-alpine3.14

RUN apk add --no-cache nginx gettext
WORKDIR /usr/src/app
COPY package*.json ./ 

COPY . . 
RUN npm install && npm run build && rm -rf node_modules
EXPOSE 8080 

CMD ["nginx", "-g", "daemon off;"]

