# Stage 1
FROM node:8 as react-build
WORKDIR /usr/src/app
COPY ./RPThreadTrackerV3.FrontEnd/package.json /usr/src/app/package.json
RUN yarn install
COPY ./RPThreadTrackerV3.FrontEnd ./
RUN yarn build
RUN npm rebuild node-sass

# Stage 2 - the production environment
FROM nginx:alpine
COPY ./.docker/config/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=react-build /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
