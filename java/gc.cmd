how to manually trigger a gc:

  jcmd <pid> GC.run

Print heap info

  jmap -heap <pid>
  
Dump heap

  jmap -dump:file=xxx.jmap <pid>

Minor GC vs Major GC vs Full GC

https://dzone.com/articles/minor-gc-vs-major-gc-vs-full

jstat:

http://docs.oracle.com/javase/7/docs/technotes/tools/share/jstat.html

Monitor GC every 2 sec:
  jstat -gc <pid> 2000

GC tuning guide:

https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/sizing.html

CMS collector:

https://stackoverflow.com/questions/19404207/old-gen-heap-is-full-and-the-eden-and-survivor-are-low-and-almost-empty
https://blog.codecentric.de/en/2013/10/useful-jvm-flags-part-7-cms-collector/
https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/cms.html

Java OOM Killer:

https://plumbr.eu/blog/memory-leaks/out-of-memory-kill-process-or-sacrifice-child
