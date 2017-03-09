display vg
    
    vgdisplay
  
display lv
    
    lvdisplay

create logic volume (root or sudo)

    lvcreate -L 20G -n lvjenkins sysvg
    mkfs.xfs /dev/sysvg/lvjenkins
    #add /dev/mapper/sysvg-lvjenkins /var/jenkins2_slave xfs    	defaults       	0 0 to /etc/fstab
    mount -a
  
grow a logic volume

    lvextend -L+50G /dev/sysvg/lvjenkins
    xfs_growfs /home
