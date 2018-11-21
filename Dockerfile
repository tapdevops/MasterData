FROM node:8.12.0-alpine

#FROM ubuntu:${VERSION_ID}

# nvidia-docker 2.0
#COPY daemon.json $DIST_DIR/daemon.json

#WORKDIR $DIST_DIR
#COPY debian ./debian

ENV 149.129.242.205:3003

#RUN sed -i "s;@VERSION@;${REVISION#*+};" debian/changelog && \
    #if [ "$REVISION" != "$(dpkg-parsechangelog --show-field=Version)" ]; then exit 1; fi


# if you need a build script, uncomment the line below
 RUN echo 'sh mybuild.sh' >> /usr/bin/start.sh -C

# if you need redis, uncomment the lines below
 RUN apk --update add redis
RUN echo 'redis-server &' >> /usr/bin/start.sh -C

RUN npm install

#daemon for cron jobs
RUN echo 'echo will install crond...' >> /usr/bin/start.sh -C
RUN echo 'crond' >> /usr/bin/start.sh -C

# Basic npm start verification
RUN echo 'nb=`cat package.json | grep start | wc -l` && if test "$nb" = "0" ; then echo "*** Boot issue: No start command found in your package.json in the scripts. See https://docs.npmjs.com/cli/start" ; exit 1 ; fi' >> /usr/bin/start.sh

RUN echo 'npm install --production' >> /usr/bin/start.sh -C

# npm start, make sure to have a start attribute in "scripts" in package.json
RUN echo 'npm start' >> /usr/bin/start.sh


#CMD export DISTRIB="$(lsb_release -cs)" && \
   # debuild --preserve-env --dpkg-buildpackage-hook='sh debian/prepare' -i -us -uc -b && \
    #mv /tmp/*.deb /dist 






