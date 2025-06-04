FROM debian:bookworm

RUN apt update && apt install -y apache2 dpkg-dev
COPY public /var/www/html
WORKDIR /var/www/html
RUN dpkg-scanpackages pool /dev/null | gzip -9c > dists/stable/main/binary-amd64/Packages.gz
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]