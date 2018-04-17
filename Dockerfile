FROM nginx:latest
MAINTAINER Markus Korn <koma0815@googlemail.com>

WORKDIR /etc/nginx


COPY nginx.conf .
COPY adjust_nginx_settings.sh .

RUN chmod +x adjust_nginx_settings.sh

ENV PROXYPASS=$PROXYPASS
EXPOSE 80

ENTRYPOINT [ "/etc/nginx/adjust_nginx_settings.sh" ]

CMD ["nginx", "-g", "daemon off;"]
