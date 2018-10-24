# Stage 1
FROM node:8 as react-build
WORKDIR /app
COPY ./RPThreadTrackerV3.FrontEnd/package.json /usr/src/app/package.json
RUN yarn
RUN yarn build
RUN npm rebuild node-sass
COPY ./RPThreadTrackerV3.FrontEnd ./

# Stage 2 - the production environment
FROM nginx:alpine
COPY ./.docker/frontend/config/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
