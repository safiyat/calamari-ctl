#! /usr/bin/env sh

set -o

sudo ceph-deploy --cluster sdcluster --username ubuntu calamari connect --master `ifconfig em1|grep 'inet addr:'|cut -d: -f2|awk '{ print $1}'|tr -d ' '` 10.41.0.93 10.41.0.94

ssh ubuntu@10.41.0.93 "sudo service salt-minion stop"
ssh ubuntu@10.41.0.94 "sudo service salt-minion stop"
