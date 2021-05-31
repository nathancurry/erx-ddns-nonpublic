# erx-ddns-nonpublic
Dynamic DNS script for EdgeRouter-X when the router isn't provisioned your public IP.

I'm using this as an appliance at my dad's house, and don't want to mess with his U-Verse internet in case there are problems when I'm away.

I set this up for a domain on NameCheap, but it likely is adaptable for many registrars.

## Setup
1. Set user variables

These correspond to DynDNS stuff

```
host           ## subdomain
domain         ## ahem
ddns_password  ## this is your account password, which is pretty sweet i guess
protocol       ## I guess this is to tell the ddns folks it's a namecheap account
```

2. copy script into place and make it executable

```
sudo cp update_ip.sh /config/scripts
sudo chmod 755 /config/scripts/update_ip.sh
```

3. enable in the router config

```
configure
set system task-scheduler task updateIP executable path /config/scripts/update_ip.sh
set system task-scheduler task updateIP interval 1h
save;commit
```

## Links

- [Forum entry I used for task-scheduler](https://community.ui.com/questions/The-correct-way-to-run-shellscript-using-task-scheduler-cron/b8bc4782-8c5b-4d67-8f41-9c31562336c9)
- There's more but I'm tired. Feel free to complain to management
