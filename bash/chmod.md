http://superuser.com/questions/91935/how-to-chmod-755-all-directories-but-no-file-recursively

To chmod 777 on folders only, skipping files:


    find /path/to/base/dir -type d -print0 | xargs -0 chmod 755 
    find /path/to/base/dir -type f -print0 | xargs -0 chmod 644

    chmod 755 $(find /path/to/base/dir -type d)
    chmod 644 $(find /path/to/base/dir -type f)
