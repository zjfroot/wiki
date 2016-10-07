###create init jenkins home from version 2.0

    cd /tmp
    mkdir jenkins_home_init_2.0
    docker run --rm -i -t -p 9001:8080 -v /Users/jajp/tmp/jenkins_home_init_2.0:/var/jenkins_home jenkinsci/jenkins:2.0

then

    tar cjvf jenkins_home_init_2.0.tar.bz2 jenkins_home_init_2.0

###create init jenkins home from version 1.618

    cd /tmp
    mkdir jenkins_home_init_1.618
    docker run --rm -i -t -p 9001:8080 -v /Users/jajp/tmp/jenkins_home_init_1.618:/var/jenkins_home jenkinsci/jenkins:1.618

then

    tar cjvf jenkins_home_init_1.618.tar.bz2 jenkins_home_init_1.618
