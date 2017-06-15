how to manually trigger a gc:

  jcmd <pid> GC.run

Print heap info

  jmap -heap <pid>
  
Dump heap

  jmap -dump:file=xxx.jmap <pid>
