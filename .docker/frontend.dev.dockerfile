# base image
FROM node:8

# set working directory
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./RPThreadTrackerV3.FrontEnd/package.json /usr/src/app/package.json
RUN yarn
RUN npm rebuild node-sass
EXPOSE 8080

# start app
CMD ["yarn", "start:docker"]
