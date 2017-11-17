# take default image of node boron i.e  node 6.x
FROM node:6.10.1

# create app directory in container
RUN mkdir -p /app

# set /app directory as default working directory
WORKDIR /app

# only copy package.json initially so that `RUN yarn` layer is recreated only
# if there are changes in package.json
ADD package.json yarn.lock /app/


# Setup apt packages for images
RUN apt-get update
RUN apt-get install vim
RUN apt-get install mongodb


# copy all file from current dir to /app in container
COPY . /app/

# expose port 4040
EXPOSE 3000

# cmd to start service
CMD [ "yarn", "start" ]
