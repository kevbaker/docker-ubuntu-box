# take default image of node boron i.e  node 6.x
FROM node:6.10.1

# create app directory in container
RUN mkdir -p /app

# set /app directory as default working directory
WORKDIR /app

# only copy package.json initially so that `RUN yarn` layer is recreated only
# if there are changes in package.json
ADD package.json /app/


# Setup apt packages for images
RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install mongo


# copy all file from current dir to /app in container
COPY . /app/

# expose port 22
EXPOSE 22


