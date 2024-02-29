FROM node:alpine as builder
WORKDIR /user/src/app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /user/src/app/build /usr/share/nginx/html
