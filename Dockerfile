FROM ubuntu:16.04
MAINTAINER whenawijanarko08@gmail.com

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update
RUN apt-get update -y

# install
RUN apt-get install -y curl git

# clean after install
RUN apt-get clean

# set environment
# we use node v6.0.0 as default

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.0.0

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Set up our PATH correctly so we don't have to long-reference npm, node, &c.
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

#you can pick which one for process manager
RUN npm i -g nodemon pm2

ENV dir /app
WORKDIR ${dir}





#FROM node:8.12.0-alpine

#FROM ubuntu:${VERSION_ID}

#nvidia-docker 2.0
#COPY daemon.json $DIST_DIR/daemon.json

#WORKDIR
#COPY debian ./debian

#ENV PORT=3001

#RUN sed -i "s;@VERSION@;${REVISION#*+};" debian/changelog && \
  # if [ "$REVISION" != "$(dpkg-parsechangelog --show-field=Version)" ]; then exit 1; fi


#if you need a build script, uncomment the line below
 #RUN echo 'sh mybuild.sh' >> /usr/bin/start.sh -C

#if you need redis, uncomment the lines below
 #RUN apk --update add redis
#RUN echo 'redis-server &' >> /usr/bin/start.sh -C

#RUN npm install

#daemon for cron jobs
#RUN echo 'echo will install crond...' >> /usr/bin/start.sh -C
#RUN echo 'crond' >> /usr/bin/start.sh -C

 #Basic npm start verification
#RUN echo 'nb=`cat package.json | grep start | wc -l` && if test "$nb" = "0" ; then echo "*** Boot issue: No start command found in your package.json in the scripts. See https://docs.npmjs.com/cli/start" ; exit 1 ; fi' >> /usr/bin/start.sh

#RUN echo 'npm install --production' >> /usr/bin/start.sh -C

 #npm start, make sure to have a start attribute in "scripts" in package.json
#RUN echo 'npm start' >> /usr/bin/start.sh


#CMD export DISTRIB="$(lsb_release -cs)" && \
    #debuild --preserve-env --dpkg-buildpackage-hook='sh debian/prepare' -i -us -uc -b && \
    #mv /tmp/*.deb /dist 







