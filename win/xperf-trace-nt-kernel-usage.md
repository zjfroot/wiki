http://serverfault.com/questions/484481/how-can-i-troubleshoot-high-kernel-time

http://blogs.technet.com/b/markrussinovich/archive/2008/04/07/3031251.aspx

http://blogs.msdn.com/b/ntdebugging/archive/2008/04/03/windows-performance-toolkit-xperf.aspx

Guide from MSDN:

[[http://msdn.microsoft.com/en-us/library/ff190971(v=vs.85).aspx]]
http://blogs.technet.com/b/jeff_stokes/archive/2012/06/29/what-is-windows-performance-analyzer-all-about-and-why-should-you-use-it-instead-of-xperfview.aspx


====== Xperf can trace nt kernel usage. ======


xperf: error: NT Kernel Logger: Cannot create a file when
  * top process monitor, because it conflicts with xperf.


Start an easy trace:
  xperf -on DiagEasy

To stop a trace and save to file test.etl:
  xperf -d test.etl

Show all available kernel providers:
  xperf -providers K
  
To view the Xperf result use 
  * xperfview or 
  * Windows Performance Analyzer 
