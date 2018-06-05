jvisualvm

Thread dump:

    kill -3 PID
or

    jstack -l JAVA_PID > /tmp/jstack.out

Memory dump:

    jmap/jhat
    jmap -heap JAVA_PID > /tmp/jmap.out
    jmap -dump:ﬁle=/tmp/heap_dump.map JAVA_PID
    jhat -J-Xmx1024m /tmp/heap_dump.map


http://www.infoq.com/presentations/troubleshooting-java-web-apps

Get heap information/usage:

    jmap -heap <PID>
