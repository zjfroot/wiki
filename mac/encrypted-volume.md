Mount encrypted volume (e.g. /dev/disk1):
http://apple.stackexchange.com/questions/42257/how-can-i-mount-an-encrypted-disk-from-the-command-line

```
#get UUID
diskutil coreStorage ls
#unlock
diskutil coreStorage unlockVolume <UUID>
```
