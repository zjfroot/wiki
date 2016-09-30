====== How to use a cache: ======

  vi /etc/ngnix/cache/site1.cache.conf

<code>
proxy_cache_path  /data/nginx/cache/site1  max_size=30000m levels=1:1:2 inactive=240m keys_zone=ivy:1024m;
proxy_temp_path   /data/nginx/cache/tmp;
log_format rt_cache '$remote_addr - $upstream_cache_status [$time_local]  '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent"';
                    
</code>

And
  vi /etc/nginx/sites-enabled/site1_cache.conf
  
<code>
 server {

	listen	 80; ## listen for ipv4
	listen	 [::]:80 default ipv6only=on; ## listen for ipv6

	server_name  localhost;

	access_log  /var/log/nginx/localhost.access.log rt_cache;

	gzip off;
 	gzip_proxied off;

	set $no_cache "";

	if ( $request_uri ~ /xxx/xxx/xxx/xxx ) {
	   set $no_cache 1;
	}


	if ( $request_uri ~ \.xml$ ) {
	   set $no_cache 1;
	}	

#	press this button to disable cache!
#	set $no_cache 1;

	location / {
		proxy_pass   http://site1.blabla.com;
		proxy_cache site1;
		proxy_cache_valid  200 301 302 7d;
		proxy_cache_use_stale updating;
		proxy_cache_valid  404 1m;
		proxy_connect_timeout 10;
		proxy_no_cache $no_cache;
		proxy_cache_bypass $no_cache;
	}
}

</code>

====== How to manually invalid a cache: ======


  cd /data/nginx/cache/
  grep -lr 'http://mydomain.pl/css/myedited.css$' .
  
And then delete the file found.
