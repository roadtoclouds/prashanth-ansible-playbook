#!/bin/bash

PERL_STABLE="5.16.1"

# echo '%< --- installing perlbrew ---'
# echo
# curl -kL http://install.perlbrew.pl | bash
# source ~/perl5/perlbrew/etc/bashrc

perlbrew install --notest perl-${PERL_STABLE}
perlbrew install-cpanm
perlbrew switch perl-${PERL_STABLE}

echo '%< --- installing carton ---'
echo
perlbrew lib create carton
perlbrew switch perl-${PERL_STABLE}@carton
source ~/perl5/perlbrew/etc/bashrc
cpanm Carton

echo '%< --- install finished ! ---'
echo 'Please add that source line to config'
echo '$ echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc'