FROM debian:latest

RUN apt-get update
RUN apt-get install apache2 aptitude curl bzip2 patch build-essential unzip -y
RUN aptitude install -y locales && apt-get clean
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

RUN mkdir -p /scripts
WORKDIR /scripts
COPY carton-setup.sh /scripts
RUN /scripts/carton-setup.sh

ADD ./files/* /scripts/

RUN  cd /scripts \
 && mkdir -p /opt/oracle \
 && unzip /scripts/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
 && unzip /scripts/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
 && unzip /scripts/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
 && unzip /scripts/instantclient-odbc-linux.x64-12.2.0.1.0-2.zip -d /opt/oracle \
 && mv /opt/oracle/instantclient_12_2 /opt/oracle/instantclient \
 && ln -sf /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so \
 && ln -sf /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so \
 && mkdir -p /opt/oracle/instantclient/network/admin

ENV LD_LIBRARY_PATH /opt/oracle/instantclient:/usr/lib:/usr/lib64
ENV ORACLE_HOME /opt/oracle/instantclient
ENV TNS_ADMIN /opt/oracle/instantclient/network/admin
ENV PERL5LIB /local/lib/perl5

# ADD ./cpanfile /cpanfile
# RUN carton install --cpanfile /cpanfile

COPY example.com.conf /etc/apache2/sites-available/example.com.conf

EXPOSE 80
EXPOSE 443
EXPOSE 8080

# Start Apache on Docker run
CMD ["apachectl", "-D", "FOREGROUND"]