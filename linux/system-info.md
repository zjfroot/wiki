**Determine amount of ram slots:**

    sudo lshw -class memory
  
**Disk IO speed**

    sudo hdparm -Tt /dev/sda
  
Or

    dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
