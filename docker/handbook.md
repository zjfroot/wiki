#docker handbook

### Move docker data folder 

```
docker ps -q | xargs docker kill
#stop docker
/etc/init.d/docker stop
ps -ef |grep docker
cd /var/lib/docker/devicemapper/mnt
umount ./*
mv /var/lib/docker $dest
ln -s $dest /var/lib/docker
#start docker
/etc/init.d/docker start
ps -ef |grep docker
```



###list all containers:
    docker ps -a
###remove a container:
    docker rm <name>
###tailing logs of a container:
    docker logs -f <name>

###run jenkins2 with named container, mapped jenkins_home:
    docker run -d -p 8080:8080 -p 50000:50000 --name jenkins2.6 -v /home/ec2-user/jenkins_homes/jenkins2_home/:/var/jenkins_home jenkinsci/jenkins:2.6

###get a shell of a running container:
    docker exec -it jenkins2.6 bash

###build a image:
    docker build -t jenkins2 .
###monitor ram cpu usage
    docker stats <name>

###remove a image:
    docker rmi <imagename>

###move docker data folder, another way
    sudo service docker stop
    sudo tar -zcC /var/lib docker > ./var_lib_docker-backup-$(date +%s).tar.gz
    sudo mv /var/lib/docker /data/
    sudo ln -s /fjord/docker /var/lib/docker
    sudo service docker start

###copy file from container to host:
    docker cp <name>:/root/.m2 m2

###remove unused/dangling containers
  docker rmi $(docker images --filter "dangling=true" -q --no-trunc)


###Tutorial of docker swarm mode:
https://docs.docker.com/engine/swarm/swarm-tutorial/
```
$ docker swarm init --advertise-addr 192.168.99.100
Swarm initialized: current node (e4hxxu7qlnwcyvlzzggrc5m0p) is now a manager.

To add a worker to this swarm, run the following command:
    docker swarm join \
    --token SWMTKN-1-37nic18z12cawso7z7t85hc28aip92hke5yqs187oruv9ml087-b0bpebp3qfvtpfpetxmkchxlp \
    192.168.99.100:2377

To add a manager to this swarm, run the following command:
    docker swarm join \
    --token SWMTKN-1-37nic18z12cawso7z7t85hc28aip92hke5yqs187oruv9ml087-0aqtz30scl6aokk5mbjv8t6ok \
    192.168.99.100:2377
```

###run container registry
    docker run -d -p 5000:5000 --restart=always --name registry registry:2

###linux, run docker without sudo, run following and logout and login
    sudo usermod -aG docker $USER
    
###run a mirror proxy registry
    http://stackoverflow.com/a/39717783/532008
    https://blog.docker.com/2015/10/registry-proxy-cache-docker-open-source/
    https://docs.docker.com/registry/configuration/#proxy
    https://docs.docker.com/registry/recipes/mirror/
    

###docker for mac, how to login to the vm/hyperkit:
    https://forums.docker.com/t/can-not-use-registry-mirror/10380/5
    screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
    type root to login
    
###Ubuntu 16.04, how to change docker daemon options, parameters:

- put DOCKER_OPTS in /etc/default/docker, for example, `DOCKER_OPTS="-H tcp://192.168.99.10:2376"` to expose docker api via tcp/http
- edit `vi /lib/systemd/system/docker.service`
```
EnvironmentFile=-/etc/default/docker
ExecStart=/usr/bin/dockerd $DOCKER_OPTS -H fd://
```
- `systemctl daemon-reload && systemctl restart docker`


### Use a different docker host from docker cli:

export DOCKER_HOST="tcp://ip:port"

How to bind to another tcp port: https://docs.docker.com/engine/reference/commandline/dockerd/#bind-docker-to-another-host-port-or-a-unix-socket


### docker java client:

https://github.com/spotify/docker-client

### docker remote api:

https://docs.docker.com/engine/reference/api/docker_remote_api_v1.24/#/create-a-container
