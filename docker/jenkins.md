###create init jenkins home from version 2.0

    cd /tmp
    mkdir jenkins_home_init_2.0
    docker run --rm -i -t -p 9001:8080 -v /tmp/jenkins_home_init_2.0:/var/jenkins_home jenkinsci/jenkins:2.0

then

    tar cjvf jenkins_home_init_2.0.tar.bz2 jenkins_home_init_2.0

###create init jenkins home from version 1.618

    cd /tmp
    mkdir jenkins_home_init_1.618
    docker run --rm -i -t -p 9002:8080 -v /tmp/jenkins_home_init_1.618:/var/jenkins_home jenkinsci/jenkins:1.618

then

    tar cjvf jenkins_home_init_1.618.tar.bz2 jenkins_home_init_1.618

###start jenkins
    
    tar jxf jenkins_home_init_1.618.tar.bz2
    cp -r jenkins_home_init_1.618 jenkins-3
    docker run --name "jenkins-3" -d -p 9003:8080 -v `pwd`/jenkins_home_3:/var/jenkins_home jenkins:1.651.3

### use a container to create jenkins home from master copy:

    docker run --rm -it -v /data/jenkins:/jenkins alpine /bin/cp -p -r /jenkins/jenkins_home_init_1.618 /jenkins/jenkins_home_2
