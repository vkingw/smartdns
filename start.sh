#!/bin/sh
if [ ! -f /smartdns/smartdns.conf ]; then
	mkdir -p /smartdns
	cp -u /config.conf /smartdns/smartdns.conf
fi
smartdns -f -x -c /smartdns/smartdns.conf
