###ssh proxy, ssh over https
https://daniel.haxx.se/docs/sshproxy.html


**Generate public key from private key**
  ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub


**DSH guide**

http://michaelmasters.blogspot.se/2009/11/dsh-distributed-shell-on-mac-osx.html


**One line command to achieve password less ssh:**

  cat .ssh/id_rsa.pub | ssh user@foobar.com 'cat >> .ssh/authorized_keys'



Socks via ssh:

SOCKS is built in to OpenSSH, so it's a trivial matter to set up a local SOCKS proxy with the -D flag. For example:

    $ ssh -D 12345 myuser@remote_ssh_server


SSH reverse tunnel

From my computer at TD:

    ssh -X -R 12345:localhost:22 jifeng@$HOME

and at home:
  ssh <-D $PROXY_PORT> -p 12345 jifzh@localhost

and then I can start chrome at home with:
  google-chrome -proxy-server="socks5://localhost:$PROXY_PORT"

SSH reverse tunnel with a middle server.


Aim: Access from machine C to A. Both C and A are behind firewalls. And open websites that only can be opened on machine A.

Machine B is on the internet, maybe an amazon cloud server. We use it as a middle server:

From machine A:
  ssh -R 12345:localhost:22 -i .ssh/keeeeeey user@serverB

And from machine C:
Add:

    <code>
        Host serverB
             Hostname serverB_IP
             User user
             IdentityFile ~/.ssh/keeeeey
             LocalForward 12345 localhost:12345
    </code>
Then to getup the tunnel: 

    ssh serverB

Then from machine C this ill ssh into machine A.
  ssh -D 12346 -p 12345 user_on_A@localhost

And -D means SOCKS proxy. So with it, you can browse any website that only can be opened on machine A.


X11 forwarding:


http://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-from-ubuntu-machine

X11 forwarding needs to be enabled on both the client side and the server side.

On the client side, the -X (capital X) option to ssh enables X11 forwarding, and you can make this the default (for all connections or for a specific conection) with ForwardX11 yes in~/.ssh/config.

On the server side, X11Forwarding yes must specified in /etc/ssh/sshd_config. Note that the default is no forwarding (some distributions turn it on in their default /etc/ssh/sshd_config), and that the user cannot override this setting.

The xauth program must be installed on the server side. If there are any X11 programs there, it's very likely that xauth will be there. In the unlikely case xauth was installed in a nonstandard location, it can be called through ~/.ssh/rc (on the server!).

jifeng: xauth is installed on centos by "yum install xorg-x11-xauth"

Note that you do not need to set any environment variables on the server. DISPLAY andXAUTHORITY will automatically be set to their proper values. If you run ssh and DISPLAY is not set, it means ssh is not forwarding the X11 connection.

To confirm that ssh is forwarding X11, check for a line containing Requesting X11 forwarding in the ssh -v -X output. Note that the server won't reply either way.


# SSHD on windows

https://wiki.jenkins-ci.org/display/JENKINS/SSH+slaves+and+Cygwin
http://www.noah.org/ssh/cygwin-sshd.html

- install cygwin with cygrunsrv and openssh
- run `ssh-host-config -y` as admin and it will ask you to create a user for sshd.
- add `set CYGWIN=binmode ntsec` to c:/cygwin/cygwin.bat before bash login
- create jenkins user
- run `/bin/mkpasswd -l –u jenkins >> /etc/passwd`
- run `cygrunsrv -S sshd` or `net start sshd`
- run `cygrunsrv --query sshd` to query status
- allow port 22 in windows firewall
