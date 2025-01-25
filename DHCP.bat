echo off
cls
IPCONFIG /RELEASE
IPCONFIG /FLUSHDNS
NET STOP DNSCACHE
NET STOP DHCP
NET START DNSCACHE
NET START DHCP
IPCONFIG /REGISTERDNS
IPCONFIG /RENEW
arp -a -d
netsh interface ip delete arpcache
netsh interface ip delete destinationcache
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset catalog
Exit

exit

