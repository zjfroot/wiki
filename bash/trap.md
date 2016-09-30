http://linux.die.net/Bash-Beginners-Guide/sect_12_02.html


12.2. Traps

12.2.1. General

There might be situations when you don't want users of your scripts to exit untimely using keyboard abort sequences, for example because input has to be provided or cleanup has to be done. The trap statement catches these sequences and can be programmed to execute a list of commands upon catching those signals.

The syntax for the trap statement is straightforward:

  trap [COMMANDS] [SIGNALS]

This instructs the trap command to catch the listed SIGNALS, which may be signal names with or without the SIG prefix, or signal numbers. If a signal is 0 or EXIT, the COMMANDS are executed when the shell exits. If one of the signals is DEBUG, the list of COMMANDS is executed after every simple command. A signal may also be specified as ERR; in that caseCOMMANDS are executed each time a simple command exits with a non-zero status. Note that these commands will not be executed when the non-zero exit status comes from part of anif statement, or from a while or until loop. Neither will they be executed if a logical AND (&&) or OR (||) result in a non-zero exit code, or when a command's return status is inverted using the ! operator.

The return status of the trap command itself is zero unless an invalid signal specification is encountered. The trap command takes a couple of options, which are documented in the Bash info pages.

Here is a very simple example, catching Ctrl+C from the user, upon which a message is printed. When you try to kill this program without specifying the KILL signal, nothing will happen:

<code>
#!/bin/bash
# traptest.sh

trap "echo Booh!" SIGINT SIGTERM
echo "pid is $$"

while :			# This is the same as "while true".
do
        sleep 60	# This script is not really doing anything.
done
</code>

12.2.2. How Bash interprets traps

When Bash receives a signal for which a trap has been set while waiting for a command to complete, the trap will not be executed until the command completes. When Bash is waiting for an asynchronous command via the wait built-in, the reception of a signal for which a trap has been set will cause the wait built-in to return immediately with an exit status greater than 128, immediately after which the trap is executed.

12.2.3. More examples

12.2.3.1. Detecting when a variable is used

When debugging longer scripts, you might want to give a variable the trace attribute and trap DEBUG messages for that variable. Normally you would just declare a variable using an assignment like VARIABLE=value. Replacing the declaration of the variable with the following lines might provide valuable information about what your script is doing:

    declare -t VARIABLE=value

    trap "echo VARIABLE is being used here." DEBUG

    # rest of the script
    12.2.3.2. Removing rubbish upon exit

The whatis command relies on a database which is regularly built using the makewhatis.cron script with cron:

    #!/bin/bash

    LOCKFILE=/var/lock/makewhatis.lock

    # Previous makewhatis should execute successfully:

    [ -f $LOCKFILE ] && exit 0

    # Upon exit, remove lockfile.

    trap "{ rm -f $LOCKFILE ; exit 255; }" EXIT

    touch $LOCKFILE
    makewhatis -u -w
    exit 0
