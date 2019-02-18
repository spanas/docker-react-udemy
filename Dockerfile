FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
#elastic beanstalk will use it and map - normally it is only info
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html




