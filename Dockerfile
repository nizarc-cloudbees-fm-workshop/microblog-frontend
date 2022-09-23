FROM us-east1-docker.pkg.dev/core-workshop/workshop-registry/yarn:3.2.3-1 as BUILDER
WORKDIR /app
COPY . .
RUN yarn install && \
    yarn run build:dev

FROM us-east1-docker.pkg.dev/core-workshop/workshop-registry/nginx:1.20.1
COPY --from=BUILDER /app/dist /usr/share/nginx/html
COPY .env /usr/share/nginx/html
COPY .env.production /usr/share/nginx/html
COPY .env.development /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
