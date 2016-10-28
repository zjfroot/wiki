
nproc, threads or processes?

http://superuser.com/questions/376532/does-gnu-linux-counts-processes-and-threads-together-when-i-limit-their-number

increase nproc for a user or globally: change `/etc/security/limits.d/90-nproc.conf` or add new file in `/etc/security/limits.d/file.conf`

`systemd` resource control:
- https://www.freedesktop.org/software/systemd/man/systemd.resource-control.html
- http://unix.stackexchange.com/questions/253903/creating-threads-fails-with-resource-temporarily-unavailable-with-4-3-kernel
- https://github.com/docker/docker/issues/19124

check maximum number of open file descriptors: `cat /proc/sys/fs/file-max`

check limit: http://www.linuxintro.org/wiki/Is_my_ulimit_exceeded
- `cat /proc/{id}/limit`
- `ls -l /proc/{id}/fd |wc -l` for number of file descriptors of a process

http://serverfault.com/questions/687026/su-bin-bash-resource-temporarily-unavailable

to monitor current nproc number of a user: `while true;do ps -eLf |grep {user} |wc -l;sleep 3;done`
