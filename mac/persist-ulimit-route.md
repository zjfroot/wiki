http://unix.stackexchange.com/questions/108174/how-to-persist-ulimit-settings-in-osx-mavericks

For example to persist a route:

Create file /etc/rc.local and add:

/sbin/route -n add 172.26.23.0/24 172.26.40.2
