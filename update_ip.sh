#!/bin/bash
#####################
### BEGIN USER CONFIG
host=""
domain=""
ddns_password=""
protocol=namecheap

### END USER CONFIG #
#####################

# IPs to test
current_ip=$(curl -s http://dynamicdns.park-your-domain.com/getip 2>/dev/null)
new_ip=$(curl http://ip-api.com/line/ -s 2>/dev/null | tail -1)

# dyndns base_url
base_url=https://dynamicdns.park-your-domain.com/update


if [ -n "$new_ip" ] && [ "$new_ip " != "$current_ip " ]; then
	  curl "${base_url}?protocol=${protocol}&host=${host}&domain=${domain}&password=${ddns_password}&ip=${new_ip}"
fi 

