@call 0.params.bat
rem Webserver
%TargetDir%\apache\bin\httpd.exe -k uninstall
%TargetDir%\mysql\bin\mysqld.exe -remove
rem Firewall
Netsh Advfirewall Firewall delete Rule name="Apache HTTPS"
Netsh Advfirewall Firewall delete Rule name="Apache HTTP"
Netsh Advfirewall Firewall delete Rule name="Server socket"
rem Dir
rmdir %TargetDir%\www
rmdir %TargetDir%\db
rmdir %TargetDir%