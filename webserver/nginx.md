#### How to use a cache:

    vi /etc/nginx/sites-enabled/default

Add
    
    proxy_cache_path /opt/nginxcache levels=1:2 keys_zone=my_cache:10m max_size=1g
                 inactive=720m use_temp_path=off;
Under location:

	proxy_cache my_cache;
	proxy_ignore_headers Cache-Control;
	proxy_cache_valid any 30m;
	proxy_cache_use_stale error timeout http_500 http_502 http_503 http_504;
	proxy_pass http://127.0.0.1:8083;



#### How to manually invalid a cache:


  cd /data/nginx/cache/
  grep -lr 'http://mydomain.pl/css/myedited.css$' .
  
And then delete the file found.

#### How to config a custom logging format with request time took for each request

	vi /etc/nginx/nginx.conf

in http section, add

	log_format apm '$request_time - $remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent"';
        access_log /var/log/nginx/access.log apm;
	
#### Performance tuning:
Guide:

https://www.linode.com/docs/web-servers/nginx/configure-nginx-for-optimized-performance
https://www.nginx.com/blog/tuning-nginx/

	vi /etc/security/limits.conf
Add

	www-data soft nofile 100000
	www-data hard nofile 120000
	www-data soft nproc 100000
	www-data hard nproc 120000
	
Edit /etc/sysctl.conf, add

	net.core.somaxconn = 65536
	net.ipv4.tcp_max_tw_buckets = 1440000
	net.ipv4.ip_local_port_range = 1024 65000
	net.ipv4.tcp_fin_timeout = 15
	net.ipv4.tcp_window_scaling = 1
	s net.ipv4.tcp_max_syn_backlog = 3240000
	
Edit /etc/nginx/nginx.conf

	events {
		worker_connections 65536;
		use epoll;
		multi_accept on;
	}
	worker_rlimit_nofile 65536;
	
tuning TCP: https://www.cyberciti.biz/faq/linux-tcp-tuning/

1. Edit /etc/sysctl.conf, add

		net.core.wmem_max=12582912
		net.core.rmem_max=12582912
		net.ipv4.tcp_rmem=10240 87380 12582912
		net.ipv4.tcp_wmem=10240 87380 12582912

