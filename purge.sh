#! /usr/bin/env sh

sudo service salt-minion stop
sudo service salt-master stop

sudo calamari-ctl clear --yes-i-am-sure

sudo su root -c "rm -rf /etc/salt/pki/master"
