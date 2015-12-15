#! /usr/bin/env sh

# sudo service salt-minion stop
# sudo service salt-master stop

# sudo calamari-ctl clear --yes-i-am-sure

# sudo su root -c "rm -rf /etc/salt/pki/master"






##
## From minions.
##

sudo apt-get -y purge salt-common diamond
sudo apt-get -y autoremove

sudo rm -rf /var/cache/salt /etc/salt /var/log/salt

##
## From masters.
##
sudo apt-get purge -y calamari-clients calamari-server diamond salt-common salt-master salt-minion postgresql*
sudo apt-get -y autoremove

sudo rm -rf /etc/salt/calamari /opt/calamari/ /var/log/calamari /etc/salt /var/log/salt /var/cache/salt

sudo pip -y uninstall ceph-deploy
