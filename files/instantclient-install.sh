#!/bin/bash -xv

cd /var/tmp/ 
mkdir -p /opt/oracle 
unzip /var/tmp/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle 
unzip /var/tmp/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle 
unzip /var/tmp/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip -d /opt/oracle 
unzip /var/tmp/instantclient-odbc-linux.x64-12.2.0.1.0-2.zip -d /opt/oracle 
mv /opt/oracle/instantclient_12_2 /opt/oracle/instantclient 
ln -sf /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so
ln -sf /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so
mkdir -p /opt/oracle/instantclient/network/admin

echo "export LD_LIBRARY_PATH=/opt/oracle/instantclient:/usr/lib:/usr/lib64" >> ~/.bashrc
echo "export ORACLE_HOME=/opt/oracle/instantclient" >> ~/.bashrc
echo "export TNS_ADMIN=/opt/oracle/instantclient/network/admin" >> ~/.bashrc
echo "export PERL5LIB=/local/lib/perl5" >> ~/.bashrc

source ~/.bashrc