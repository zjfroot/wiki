Make a folder and its sub contents read and writable by anyone

    find somedir \( -type d -exec chmod u+rwx,g+rwx,o+rwx {} \; -o -type f -exec chmod u+rw,g+rw,o+rw {} \; \)
