FROM node:13.12.0-alpine as build-step

# set working directory
RUN mkdir /app
WORKDIR /app

# install app dependencies
COPY package.json /app
COPY . /app
RUN npm i \
    && npm install \
    && npm run build --prod

#FROM httpd:2.4
#COPY --from=build-step /app/build /usr/local/apache2/htdocs/

FROM nginx:1.17.1-alpine
COPY --from=build-step /app/build /usr/share/nginx/html

#ENV DEBIAN_FRONTEND=noninteractive
#RUN apt-get update
#RUN apt-get install unzip apache2 -y
#RUN apt-get update
#RUN apt-get install php7.2 curl -y
#RUN apt-get install php7.2-curl -y
#RUN apt-get install libapache2-mod-php7.2 -y

#RUN a2enmod php7.2
#RUN a2enmod rewrite

#WORKDIR /opt
#RUN mkdir /leaf_package

#WORKDIR /usr/local
#RUN mkdir /leaf


#ADD leaf-ui-client-3.8.2.tar.gz /usr/local/leaf/
#RUN unzip /opt/i2b2webclient-1710.zip -d /var/www/html
#RUN mv /usr/local/leaf/build/ /usr/local/apache2/htdocs

# VOLUME ./i2b2-webclient-master /var/www/html/webclient

#RUN sed -i "s#name:.*#name:\"test\",#g" /var/www/html/webclient/i2b2_config_data.js
#RUN sed -i "s#urlCellPM:.*#urlCellPM:\"http://jboss:8080/i2b2/services/PMService/\",#g" /var/www/html/webclient/i2b2_config_data.js
#RUN sed -i "s#\"http://localhost:9090\",.*#\"http://localhost:9090\",\"http://jboss:8080\",#g" /var/www/html/webclient/index.php


# ADD ./index.php /var/www/html/

#ADD ./start.sh .
#RUN chmod +x start.sh
#ADD ./parametrage.sh .
#RUN chmod +x parametrage.sh

#RUN touch deployed
#RUN echo 'false'>deployed

#ENTRYPOINT ["./start.sh"]
