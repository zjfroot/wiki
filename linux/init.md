Example: Creat a jetty start up script, running as user "apollon":

Create /etc/init.d/jetty

    <code bash>
    #!/bin/bash
    # chkconfig: 2345 99 01
    # description: Jetty
    #
    # Get function from functions library
    . /etc/init.d/functions
    # Start the service FOO
    export LANG=en_US.UTF-8
    export JAVA_HOME=/app01/java/jdk1.7.0_17
    export JETTY_HOME=/app01/apollon/jetty/current
    export PATH=$JAVA_HOME/bin:$PATH:$JETTY_HOME/bin


    start() {
        /bin/su - apollon -c 'jetty start'
    }
    # Restart the service FOO
    stop() {
        /bin/su - apollon -c 'jetty stop'
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
            status FOO
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
    </code>

Then run:
  chkconfig --add jetty

Ref:
http://serverfault.com/questions/29788/what-is-needed-for-a-linux-service-to-be-supported-by-chkconfig
