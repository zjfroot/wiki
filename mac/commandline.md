Enable VNC:

http://apple.stackexchange.com/questions/30238/how-to-enable-os-x-screen-sharing-vnc-through-ssh:

  #To turn VNC on:
  sudo  /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -    configure -access -on -clientopts -setvnclegacy -vnclegacy yes -clientopts -setvncpw -vncpw mypasswd -restart -agent -privs -all
  #To turn VNC off:
  sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off
  #Configure network:
  networksetup -setmanual "Ethernet" 192.168.110.1 255.255.0.0 192.168.110.1

Show DNS Server:
  scutil --dns | grep nameserver\[[0-9]*\]
  
Install dmg via command line:

First, mount the dmg image : sudo hdiutil attach <image>.dmg

The image will be mounted to /Volumes/<image>. Mine contained a package which i installed with: sudo installer /Volumes/<image>/<image>.pkg -target /.

Finally unmount the image: sudo hdiutil detach /Volumes/<image>.

Install certificate via command line:
<code>
security create-keychain -p password bobbins.keychain
security add
security add-certificates ./MyCertificate.cer
security unlock
security unlock-keychain -p password bobbins.keychain
security import 
security import ./MyPrivateKey.p12 -k bobbins.keychain -P privateKeyPassword
</code>
http://stackoverflow.com/questions/7485806/install-p12-or-cer-in-console-macos

Install mobile provisioning file via command line:
<code>
uuid=`grep UUID -A1 -a adhoc.mobileprovision | grep -o "[-A-Z0-9]\{36\}"`
cp adhoc.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/$uuid.mobileprovision
</code>
http://stackoverflow.com/questions/10398456/can-an-xcode-mobileprovision-file-be-installed-from-the-command-line
