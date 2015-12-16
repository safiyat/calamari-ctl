#! /usr/bin/env sh

sudo apt-get update

sudo apt-get install -y --force-yes calamari-clients calamari-server diamond python-pip


sudo pip install --upgrade ceph-deploy

sudo chmod 0666 /var/log/calamari/cthulhu.log

echo "Copy the keys from the remote system."

sudo calamari-ctl initialize --admin-username ubuntu --admin-password ubuntu --admin-email cloudplatform@snapdeal.com

sudo service salt-minion stop
sudo service salt-master stop

##
## On first master.
##

# sudo ceph-deploy --cluster sdcluster --username ubuntu calamari connect --master `ifconfig em1|grep 'inet addr:'|cut -d: -f2|awk '{ print $1}'|tr -d ' '` 10.41.0.93 10.41.0.94
