To resolve the generated hostname to the local ipv4 address:

Add file /etc/init.d/fix-hostname-resolve:

    # description: Set the hostname to resolve to 127.0.0.1
    # author "Jifeng Zhang <jifeng.zhang@tradedoubler.com>"
    # Get function from functions library
    . /etc/init.d/functions

    start() {
    HOSTNAME=`/bin/hostname`
    IPV4=`/usr/bin/GET http://169.254.169.254/latest/meta-data/local-ipv4`
    cat <<EOF > /etc/hosts
    # This file is automatically genreated
    127.0.0.1   localhost localhost.localdomain
    $IPV4 $HOSTNAME
    EOF
    }
    # Restart the service FOO
    stop() {
        echo "Do nothing"
    }
    ### main logic ###
    case "$1" in
      start)
            start
            ;;
      stop)
            stop
            ;;
      status)
            ;;
      restart|reload|condrestart)
            stop
            start
            ;;
      *)
            echo $"Usage: $0 {start|stop|restart|reload|status}"
            exit 1
    esac
    exit 0

And then run:
    chkconfig --add fix-hostname
