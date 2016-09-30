Basics:

http://docs.oracle.com/javase/6/docs/technotes/guides/visualvm/jmx_connections.html

Using jvisualvm behind a firewall.

Opening the jmx port is not enough:

http://beautifulbytes.wordpress.com/2012/02/16/using-a-java-agent-to-monitor-remote-applications-via-jmx-through-a-firewall/

https://www.google.se/search?q=cannot+connect+using+service+jmx&oq=can+not+connect+jmx+using+&aqs=chrome.1.69i57j0l3.6243j0&sourceid=chrome&ie=UTF-8#q=jmx+behind+firewall&safe=off

Using x11 forwarding is recommanded. ssh

JMX uses two ports, one jmx port and one rmi port.
To get logs of jconsole, you can use:

    jconsole -J-Djava.util.logging.config.file=logging.properties

the logging.properties file looks like this:

    handlers= java.util.logging.ConsoleHandler
    .level=INFO

    java.util.logging.FileHandler.pattern = %h/java%u.log
    java.util.logging.FileHandler.limit = 50000
    java.util.logging.FileHandler.count = 1
    java.util.logging.FileHandler.formatter = java.util.logging.XMLFormatter

    java.util.logging.ConsoleHandler.level = FINEST
    java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter

    // Use FINER or FINEST for javax.management.remote.level - FINEST is
    // very verbose...
    //
    javax.management.level=FINEST
    javax.management.remote.level=FINEST

