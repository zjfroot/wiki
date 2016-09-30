====== How to build openjdk8 on Ubuntu ======


===== Get source code: =====

    mkdir -p ~/tmp
    cd ~/tmp
    hg clone http://hg.openjdk.java.net/jdk8u/jdk8u20/
    cd jdk8u20
    bash get_source.sh
===== Install dependencies: =====


    sudo apt-get install build-essential libX11-dev libxext-dev libxrender-dev libxtst-dev libxt-dev libcups2-dev libfreetype6-dev libasound2-dev
  
===== Configure =====
    
    bash configure
  
  ===== Make =====
    
    make


