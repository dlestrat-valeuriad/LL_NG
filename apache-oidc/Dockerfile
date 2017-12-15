FROM debian:jessie

# install Apache OIDC
RUN apt-get update
RUN apt-get -y install apache2 libapache2-mod-auth-openidc vim wget

# config OIDC
COPY proto-apache2.conf /etc/apache2/sites-enabled/proto-apache2.conf
RUN rm /etc/apache2/sites-enabled/000-default.conf

# redemarrage Apache
RUN a2enmod auth_openidc ssl proxy proxy_http

EXPOSE 80
VOLUME ["/var/log/apache2", "/etc/apache2"]

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]