====== Setup https for apache ======


Create self signed certificate:
<code>
sudo mkdir /etc/apache2/ssl 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:New York
Locality Name (eg, city) []:NYC
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Awesome Inc
Organizational Unit Name (eg, section) []:Dept of Merriment
Common Name (e.g. server FQDN or YOUR name) []:example.com                  
Email Address []:webmaster@awesomeinc.com
</code>

https://www.digitalocean.com/community/articles/how-to-create-a-ssl-certificate-on-apache-for-ubuntu-12-04

Redirect http to https on all pages:

<code>
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
Redirect a single page to https:
</code>

You can also redirect a single page from http to http in Apache by using this in your configuration file or .htaccess file:

<code>
RewriteEngine On
RewriteRule ^apache-redirect-http-to-https\.html$ https://www.yoursite.com/apache-redirect-http-to-https.html [R=301,L]
</code>
