FROM debian:bookworm

RUN apt update && apt install -y apache2 dpkg-dev
WORKDIR /var/www/html
COPY mirror/ /var/www/html
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
