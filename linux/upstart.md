Mount a disk using upstart script:

Create file /etc/init/mount-app01.conf:

    <code>
    #
    # description: Mounts the EBS Volume
    #
    start on runlevel [2345]
    exec mount /dev/xvdb /app01
    </code>

Reference:
http://upstart.ubuntu.com/cookbook/
