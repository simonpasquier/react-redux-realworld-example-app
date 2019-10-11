# Build the backend assets.
FROM node:lts as frontend-build

WORKDIR /app
COPY . /app

RUN npm install && npm run build

FROM nginx:latest

COPY --from=frontend-build /app/build/ /app
COPY --from=frontend-build /app/conf/nginx.conf /etc/nginx/conf.d/default.conf
