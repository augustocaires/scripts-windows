Sfc /ScanNow
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /RestoreHealth
Dism /online /cleanup-image /startcomponentcleanup

SC config trustedinstaller start=auto