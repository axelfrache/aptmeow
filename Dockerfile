FROM debian:bookworm

RUN mkdir -p dists/stable/main/binary-all && \
    dpkg-scanpackages pool /dev/null | gzip -9c > dists/stable/main/binary-all/Packages.gz
RUN apt update && apt install -y apache2 dpkg-dev
COPY mirror /var/www/html
WORKDIR /var/www/html
RUN dpkg-scanpackages pool /dev/null | gzip -9c > dists/stable/main/binary-amd64/Packages.gz
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]