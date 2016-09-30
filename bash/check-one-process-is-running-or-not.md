    pc=`ps -ef |grep "EmcController -t" |grep -v grep |wc -l`

    ts=`date +"%C%y-%m-%d %H:%M:%S"`
    if [ $pc -gt 0 ] ; then
        echo "$ts  EMC transfer application is running already, no new transfer application
    will be run this time";
        exit 0;
    fi
    echo "$ts  Starting new EMC transfer application";
