@call 0.params.bat
rem Dir
mklink /j %TargetDir% %SourceDir%\EmpireHost
mklink /j %TargetDir%\www %SourceDir%\EmpireSite
mklink /j %TargetDir%\db %SourceDir%\EmpireServer\Env\Database
rem Firewall
Netsh Advfirewall Firewall Add Rule name="Apache HTTPS" dir=in action=allow description="Apache HTTPS" profile=any localport=443 protocol=tcp
Netsh Advfirewall Firewall Add Rule name="Apache HTTP" dir=in action=allow description="Apache HTTP" profile=any localport=80 protocol=tcp
Netsh Advfirewall Firewall Add Rule name="Server socket" dir=in action=allow description="Server socket" profile=any localport=25600 protocol=tcp
rem Webserver
%TargetDir%\apache\bin\httpd.exe -k install
%TargetDir%\mysql\bin\mysqld -install
@echo off
rem Commands
rem bitsadmin /transfer myDownloadJob /download /priority normal https://download.visualstudio.microsoft.com/download/pr/014120d7-d689-4305-befd-3cb711108212/973ba048c7cfad6da91f9228a09c50eb/windows8.1-kb4486105-arm.msu c:\windows8.1-kb4486105-arm.msu 