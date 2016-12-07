Examples of how to use rsync

http://www.thegeekstuff.com/2010/09/rsync-command-examples/

    rsync -avz --delete svn@192.168.145.10:/home/svn/svnrepos/ /home/backup/mirrors/svn/

how to rsync with sudo (NOPASSWD) on remote:
    #set NOPASSWD for user foo on sudo rsync:
    vi /etc/sudoers
    add: foo ALL= NOPASSWD:/usr/bin/rsync
    
    sync -avz -e "ssh" --rsync-path="sudo rsync" foo@host:/var/jenkins_home .
