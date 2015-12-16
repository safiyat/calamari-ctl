
#! /usr/bin/env sh

set -o verbose


sudo ceph-deploy --cluster sdcluster --username ubuntu calamari connect --master `ifconfig em1|grep 'inet addr:'|cut -d: -f2|awk '{ print $1}'|tr -d ' '` 10.41.0.93 10.41.0.94

ssh ubuntu@10.41.0.93 "sudo service salt-minion stop"
ssh ubuntu@10.41.0.94 "sudo service salt-minion stop"

ssh ubuntu@10.41.0.93 "echo -e \"master:\n    - 10.41.0.127\n    - 10.41.0.128\n    - 10.41.0.187\" | sudo tee /etc/salt/minion.d/calamari.conf"
ssh ubuntu@10.41.0.94 "echo -e \"master:\n    - 10.41.0.127\n    - 10.41.0.128\n    - 10.41.0.187\" | sudo tee /etc/salt/minion.d/calamari.conf"

ssh ubuntu@10.41.0.93 "sudo sed -i -e \"s/#log_level: warning/log_level: warning/g\" /etc/salt/minion"
ssh ubuntu@10.41.0.94 "sudo sed -i -e \"s/#log_level: warning/log_level: warning/g\" /etc/salt/minion"

sudo service salt-master start
ssh ubuntu@10.41.0.128 "sudo service salt-master start"
ssh ubuntu@10.41.0.187 "sudo service salt-master start"

ssh ubuntu@10.41.0.93 "sudo service salt-minion start"
ssh ubuntu@10.41.0.94 "sudo service salt-minion start"

