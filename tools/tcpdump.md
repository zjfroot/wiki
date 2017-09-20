### To do tcp dump on an interface and save data for Wireshark.

    sudo tcpdump -i en0 -s 0 -w ~/tmp/tcpdump-fmac01-scp-from-vcsto host vc-sto.int.xxx.com
    sudo tcpdump -i en4 -s 0 -w ~/tmp/tcpdump-vcsto-to-localhost host vc-sto.int.xxx.com
  
More about tcpdump: http://danielmiessler.com/study/tcpdump/

### Show all traffic for trying to resolve dns.
     sudo tcpdump -i en0 -s 5000 -n port 53
