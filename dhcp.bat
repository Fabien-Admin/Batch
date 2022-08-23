@echo off
	setlocal
     
    Rem *** Récupération de l'index de la carte réseau active
    for /F %%I in ('wmic nicconfig where "IPEnabled=TRUE" get index ^|findstr /r [0-9]') do (
    Rem *** Récupération du nom de la carte réseau active
    for /F "tokens=*" %%N in ('wmic nic where "deviceid=%%I" get NetConnectionID ^| findstr /v /r  "^$ NetConnectionID"') do  (
     
	   Rem *** Appel de commande Activation DHCP
       CALL :ENA-DHCP %%N

      )
    )
	goto end
     
	REM *** Récupération du nom de la carte et activation de l'adresse IP et des serveurs DNS en DHCP  
    :ENA-DHCP
       set nicname=%*
         netsh interface ipv4 set address name="%nicname%" source=dhcp  1>nul 2>nul
		 netsh interface ipv4 set dnsservers name="%nicname%" source=dhcp 1>nul 2>nul
	:end