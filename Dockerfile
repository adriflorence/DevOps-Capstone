# base image includes platform dependencies required
# this base image is the Alpine version of Nginx. 
# which provides the configured web server on the Linux Alpine distribution.
FROM nginx:alpine
COPY . /usr/share/nginx/html