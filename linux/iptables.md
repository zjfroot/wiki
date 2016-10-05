use ufw to simply the configuration of iptables:

sudo ufw enable

sudo ufw allow 61616

sudo ufw status

###Redirect traffic on port 80 to 8080

    $ sudo iptables -A PREROUTING -t nat -i eth0 -p tcp -- dport 80 -j REDIRECT --to-port 8080
    $ sudo iptables -t nat -I OUTPUT -p tcp -o lo --dport 80 -j REDIRECT --to-ports 8080
