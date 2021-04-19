FROM debian:latest

RUN apt-get update
RUN apt-get install aptitude curl bzip2 patch build-essential -y
RUN aptitude install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

WORKDIR /scripts
RUN mkdir -p /scripts
COPY carton-setup.sh /scripts
RUN /scripts/carton-setup.sh

