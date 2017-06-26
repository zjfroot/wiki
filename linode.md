###Setup Linode Server

Create user zjfroot

Add pub key to user zjfroot

disable ssh login for root

disable ssh login using password

turn off ipv6 for ubuntu security update site, Open /etc/gai.conf Uncomment the following line:

```
#
# For sites which prefer IPv4 connections change the last line to
#
precedence ::ffff:0:0/96 100
```

stress test cpu: (https://joshtronic.com/2017/02/14/five-dollar-showdown-linode-vs-digitalocean-vs-lightsaild-vs-vultr/)

    sysbench --test=cpu run

