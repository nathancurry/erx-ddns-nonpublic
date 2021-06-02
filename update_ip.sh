#!/bin/bash
#####################
### BEGIN USER CONFIG
host=""
domain=""
ddns_password=""

### END USER CONFIG #
#####################

# IPs to test
current_ip=$(host -4 -t A ${host}.${domain} | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}$")
new_ip=$(curl http://ip-api.com/line/ -s 2>/dev/null | tail -1)

# dyndns base_url
base_url=https://dynamicdns.park-your-domain.com/update


if [ -n "$new_ip" ] && [ "$new_ip " != "$current_ip " ]; then
	  curl -p "${base_url}?host=${host}&domain=${domain}&password=${ddns_password}&ip=${new_ip}"
fi 

