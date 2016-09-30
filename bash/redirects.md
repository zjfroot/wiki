Redirect all output, (include error) to a file:

The classic and portable (Bash pre-4) way is:

    cmd >> outfile 2>&1
A nonportable way, starting with Bash 4 is

    cmd &>> outfile
