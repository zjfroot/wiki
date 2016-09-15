== Viewing network interfaces: ==


http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1031111

== CPU share, what does it mean ==


http://pubs.vmware.com/vsphere-4-esx-vcenter/index.jsp?topic=/com.vmware.vsphere.resourcemanagement.doc_41/getting_started_with_resource_management/c_shares.html

== how to partition ==


  * http://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=1036609
  * http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1009829

== ESXI on mac mini: ==


http://www.virtuallyghetto.com/apple

== SCP between ESXi, need to open up firewall: ==


vSphere Client in Host -> Configuration -> Security Profile. Generally the inbound rule for the SSH Server is enabled when you enable the SSH Server on the host (also done through the Security Profile settings).

== vCPU cores: ==

http://frankdenneman.nl/2013/09/18/vcpu-configuration-performance-impact-between-virtual-sockets-and-virtual-cores/#comment-20293

== Call "HostStorageSystem.ComputeDiskPartitionInfo" for object "storageSystem" on ESXi "192.168.1.4" failed. ==

https://communities.vmware.com/message/2294919#2294919

Check SMART data of a storage:
http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2040405
Open a console or SSH session to the ESXi host. For more information, see Using ESXi Shell in ESXi 5.x (2004746).
  Determine the device parameter to use by running the command:
  # esxcli storage core device list

  Read the data from the device (Where device is a value found in step 1.):
  # esxcli storage core device smart get -d device

