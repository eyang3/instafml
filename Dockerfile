FROM node:14-alpine3.14

ARG API_SERVER
ENV API_SERVER=$API_SERVER

RUN apk add --no-cache nginx gettext
WORKDIR /usr/src/app
COPY package*.json ./ 

COPY . . 
RUN npm install && npm run build && rm -rf node_modules
RUN envsubst '$API_SERVER' < default.template > /etc/nginx/http.d/default.conf
EXPOSE 4000 

CMD ["nginx", "-g", "daemon off;"]

