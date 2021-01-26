#!/bin/ash -ex

adduser -H -D named

chown -R named /var/named

named -g -u named -c /etc/bind/named.conf
