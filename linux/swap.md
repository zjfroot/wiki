Check if there is any swap actived:

    sudo swapon -s

Create a swap file 2048 MB

    sudo dd if=/dev/zero of=/swapfile bs=1024 count=2048k
    
Prepare the swap file:

    sudo mkswap /swapfile
    
Activate the swap file:

    sudo swapon /swapfile
    
Add to fstab:

    /swapfile       none    swap    sw      0       0 
    
Change swappiness:

    echo 10 | sudo tee /proc/sys/vm/swappiness
    echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
    
Secure the swap file:
    sudo chown root:root /swapfile 
    sudo chmod 0600 /swapfile
