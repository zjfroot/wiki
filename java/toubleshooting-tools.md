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


Native memory tracking:

https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr007.html

    Start the JVM with summary or detail tracking using the command line option: -XX:NativeMemoryTracking=summary or -XX:NativeMemoryTracking=detail.

    Establish an early baseline - use NMT baseline feature to get a baseline to compare during development and maintenance by running: jcmd <pid> VM.native_memory baseline.

    Monitor memory changes using: jcmd <pid> VM.native_memory detail.diff.

    If the application leaks a small amount of memory, it make take a while to show up.
