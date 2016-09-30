http://jeremy.zawodny.com/blog/archives/010717.html

    #!/bin/bash

    FAIL=0

    echo "starting"

    ./sleeper 2 0 &
    ./sleeper 2 1 &
    ./sleeper 3 0 &
    ./sleeper 2 0 &

    for job in `jobs -p`
    do
        echo $job
        wait $job || let "FAIL+=1"
    done

    echo $FAIL

    if [ "$FAIL" == "0" ];
    then
        echo "YAY!"
    else
        echo "FAIL! ($FAIL)"
    fi''
