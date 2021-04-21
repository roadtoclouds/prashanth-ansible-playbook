#!/bin/bash

PERL_STABLE="5.18.1"

echo '%< --- installing perlbrew ---'
echo
export PERLBREW_ROOT=/opt/perl5
curl -kL http://install.perlbrew.pl | bash
source ${PERLBREW_ROOT}/etc/bashrc
perlbrew install --notest perl-${PERL_STABLE} -f 
perlbrew install-cpanm -f
perlbrew switch perl-${PERL_STABLE} -f

echo '%< --- installing carton ---'
echo
perlbrew lib create carton -f
perlbrew switch perl-${PERL_STABLE}@carton -f
source ${PERLBREW_ROOT}/etc/bashrc
cpanm Carton

echo '%< --- install finished ! ---'
echo 'Please add that source line to config'
echo "source ${PERLBREW_ROOT}/etc/bashrc" >> ~/.bashrc