#!/bin/ash -ex

adduser -H -D named

chown -R named /var/bind

#rndc-confgen  >  /usr/local/etc/rndc.conf
#sed -n '/named.conf/,/named.conf/p'  /usr/local/etc/rndc.conf|tail -n +2|head -n -1|sed 's/^# //g' > /etc/bind/named.conf.rndc

named -g -u named -c /etc/bind/named.conf
