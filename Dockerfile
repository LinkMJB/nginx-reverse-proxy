FROM nginx:latest

WORKDIR /etc/nginx

ARG REMOTE_HOST=localhost
ENV REMOTE_HOST $REMOTE_HOST
ARG REMOTE_PORT=8993
ENV REMOTE_PORT $REMOTE_PORT
ARG LOCAL_CONTEXT=''
ENV LOCAL_CONTEXT $LOCAL_CONTEXT

COPY ./nginx/nginx.conf /etc/nginx/

RUN apt-get update && apt-get install openssl

EXPOSE 8443

COPY ./run.sh .

ENTRYPOINT ["./run.sh"]
