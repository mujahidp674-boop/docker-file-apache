FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 git ca-certificates 
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mujahidp674-boop/docker-file-apache.git /tmp/website 
&& cp /tmp/website/index.html /var/www/html/index.html 
&& rm -rf /tmp/website

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
