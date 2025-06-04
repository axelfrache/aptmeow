FROM debian:bookworm

RUN apt update && apt install -y apache2 dpkg-dev
WORKDIR /var/www/html
COPY mirror/ /var/www/html
RUN mkdir -p dists/stable/main/binary-all && \
    dpkg-scanpackages pool /dev/null | gzip -9c > dists/stable/main/binary-all/Packages.gz
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]