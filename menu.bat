@echo off
:menu
cls
echo ==========================================
echo        IP Configuration Advanced Menu
echo ==========================================
echo  1.  View IP Configuration
echo  2.  Release IP (DHCP)
echo  3.  Renew IP (DHCP)
echo  4.  Set Static IP
echo  5.  Set Dynamic IP (DHCP)
echo  6.  View Network Connections
echo  7.  Flush DNS Cache
echo  8.  Display DNS Resolver Cache
echo  9.  Set Preferred DNS Server
echo 10.  Set Alternate DNS Server
echo 11.  Enable Network Adapter
echo 12.  Disable Network Adapter
echo 13.  Check Internet Connectivity (Ping)
echo 14.  Show Active TCP Connections
echo 15.  View Routing Table
echo 16.  View ARP Cache
echo 17.  Clear ARP Cache
echo 18.  Reset TCP/IP Stack
echo 19.  Show All Listening Ports
echo 20.  Exit
echo ==========================================
set /p choice=Enter your choice: 

if "%choice%"=="1" goto view_ip
if "%choice%"=="2" goto release_ip
if "%choice%"=="3" goto renew_ip
if "%choice%"=="4" goto set_static_ip
if "%choice%"=="5" goto set_dhcp
if "%choice%"=="6" goto view_networks
if "%choice%"=="7" goto flush_dns
if "%choice%"=="8" goto view_dns_cache
if "%choice%"=="9" goto set_dns
if "%choice%"=="10" goto set_alt_dns
if "%choice%"=="11" goto enable_adapter
if "%choice%"=="12" goto disable_adapter
if "%choice%"=="13" goto check_ping
if "%choice%"=="14" goto show_tcp_connections
if "%choice%"=="15" goto view_routing_table
if "%choice%"=="16" goto view_arp
if "%choice%"=="17" goto clear_arp
if "%choice%"=="18" goto reset_tcp_ip
if "%choice%"=="19" goto show_listening_ports
if "%choice%"=="20" exit

echo Invalid choice! Try again.
pause
goto menu

:view_ip
cls
ipconfig /all
pause
goto menu

:release_ip
cls
ipconfig /release
echo IP Released!
pause
goto menu

:renew_ip
cls
ipconfig /renew
echo IP Renewed!
pause
goto menu

:set_static_ip
cls
set /p ip=Enter Static IP Address:  
set /p mask=Enter Subnet Mask:  
set /p gateway=Enter Default Gateway:  
netsh interface ip set address "Ethernet" static %ip% %mask% %gateway%
echo Static IP Set Successfully!
pause
goto menu

:set_dhcp
cls
netsh interface ip set address "Ethernet" dhcp
echo DHCP Enabled!
pause
goto menu

:view_networks
cls
netsh wlan show interfaces
pause
goto menu

:flush_dns
cls
ipconfig /flushdns
echo DNS Cache Flushed!
pause
goto menu

:view_dns_cache
cls
ipconfig /displaydns
pause
goto menu

:set_dns
cls
set /p dns=Enter Preferred DNS Server:  
netsh interface ip set dns "Ethernet" static %dns%
echo Preferred DNS Set to %dns%
pause
goto menu

:set_alt_dns
cls
set /p dns=Enter Alternate DNS Server:  
netsh interface ip add dns "Ethernet" %dns% index=2
echo Alternate DNS Set to %dns%
pause
goto menu

:enable_adapter
cls
set /p adapter=Enter Network Adapter Name:  
netsh interface set interface "%adapter%" enabled
echo Adapter Enabled!
pause
goto menu

:disable_adapter
cls
set /p adapter=Enter Network Adapter Name:  
netsh interface set interface "%adapter%" disabled
echo Adapter Disabled!
pause
goto menu

:check_ping
cls
set /p host=Enter Host to Ping:  
ping %host%
pause
goto menu

:show_tcp_connections
cls
netstat -an
pause
goto menu

:view_routing_table
cls
route print
pause
goto menu

:view_arp
cls
arp -a
pause
goto menu

:clear_arp
cls
netsh interface ip delete arpcache
echo ARP Cache Cleared!
pause
goto menu

:reset_tcp_ip
cls
netsh int ip reset
echo TCP/IP Stack Reset!
pause
goto menu

:show_listening_ports
cls
netstat -ano | find "LISTEN"
pause
goto menu
