#!/bin/bash

PERL_STABLE="5.18.1"

echo '%< --- installing perlbrew ---'
echo
curl -kL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc

perlbrew install --notest perl-${PERL_STABLE} -f 
perlbrew install-cpanm -f
perlbrew switch perl-${PERL_STABLE} -f

echo '%< --- installing carton ---'
echo
perlbrew lib create carton -f
perlbrew switch perl-${PERL_STABLE}@carton -f
source ~/perl5/perlbrew/etc/bashrc
cpanm Carton

echo '%< --- install finished ! ---'
echo 'Please add that source line to config'
echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc