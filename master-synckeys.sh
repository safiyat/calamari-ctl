#! /usr/bin/env sh
set -o
#if [ $# -lt 2 ]
#then
#    case $# in
#	"0")
#	    echo -n "Please enter the source IP address: "
#	    read src
#	    echo -n "Please enter the destination IP address: "
#	    read dest
#	    ;;
#
#	"1")
#	    echo -n "Please enter the destination IP address: "
#	    read dest
#	    ;;
#    esac
#else
#    src=$1
#    dest=$2
#fi

#sudo su root -c "scp -r $src:/etc/salt/pki/master $dest:/etc/salt/pki/master"
#ssh $src "sudo cp -r /etc/salt/pki/master/ /tmp/; sudo scp -r /tmp/master $dest:/tmp/"

#echo "Running: ssh $src \"sudo scp -r /etc/salt/pki/master/ $dest:/tmp/\""
#ssh $src "sudo scp -r /etc/salt/pki/master/ $dest:/tmp/"

#echo "Running: ssh $dest \"sudo mv /tmp/master /etc/salt/pki/\""
#ssh $dest "sudo mv -vf /tmp/master /etc/salt/pki/"
# stat -c %a /etc/salt/pki/master


sudo scp -r /etc/salt/pki/master ubuntu@10.41.0.128:/tmp/
sudo scp -r /etc/salt/pki/master ubuntu@10.41.0.187:/tmp/

ssh ubuntu@10.41.0.128 "sudo mv -f /etc/salt/pki/master /etc/salt/pki/master.bak; sudo mv -f /tmp/master /etc/salt/pki/"
ssh ubuntu@10.41.0.187 "sudo mv -f /etc/salt/pki/master /etc/salt/pki/master.bak; sudo mv -f /tmp/master /etc/salt/pki/"


