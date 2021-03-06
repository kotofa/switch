@echo off
chcp 866 >nul 2>&1

COLOR 0F

set wd=%temp%\sdfiles
set theme=0
set clear=0
set cfw=ATMOS
set cfwname=Atmosphere
set lang=0
set bootscrn=1
set fw=0

:disclaimer
cls
ECHO ==================================================================
ECHO.
ECHO    �� ����� ������ Atmosphere ��� �室� � Homebrew Menu �㦭� 
ECHO               ����᪠�� ��졮� 㤥ন��� ������ R
ECHO.
ECHO          �᫨ ��� ��訢�� 8.0.0, ��� �㦭� ���� � ��樨
ECHO              (�㪢� O �� ᫥���饬 ��࠭�) � ����� ��
ECHO.
ECHO      ������ R, ��⥬ Enter, �᫨ �� ����������� � ����ᠭ��
ECHO                      � ��⮢� �த������
ECHO.       
ECHO ------------------------------------------------------------------
ECHO.
ECHO      For enter Homebrew Menu on new versions of Atmosphere, 
ECHO                 hold R button while enter Albums
ECHO.
ECHO         If your OFW version is 8.0.0, you need procide
ECHO                    to options and choose it
ECHO.
ECHO    Press R and Enter if you has read this information and ready
ECHO                  to proceed to installation
ECHO.
ECHO ==================================================================
ECHO.
ECHO.
ECHO.
ECHO.

set st=
set /p st=

for %%A in ("R" "r" "�" "�") do if "%st%"==%%A (GOTO START)
for %%A in ("R" "r" "�" "�") do if "%st%" neq %%A (GOTO disclaimer)

cls

:START
:choose_cfw
cls
ECHO ------------------------------------------------------------------
ECHO            ======          Select CFW           =====
ECHO ------------------------------------------------------------------
ECHO.
ECHO    Choose SXOS only if you bought it or will buy
ECHO.
ECHO    �롨�� SXOS ⮫쪮, �᫨ �� �㯨�� �� ��� ᮡ�ࠥ���
ECHO.
ECHO           1. Atmosphere
ECHO           2. SXOS
ECHO           3. Both
ECHO.
ECHO ==================================================================
ECHO                                                       O.  Options
ECHO                                                       Q.  Quit

set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (
	set cfw=ATMOS
	set cfwname=Atmosphere
)
for %%A in ("2") do if "%st%"==%%A (
	set cfw=SXOS
	set cfwname=SX OS     
)
for %%A in ("3") do if "%st%"==%%A (
	set cfw=BOTH
	set cfwname=both OSes 
)
for %%A in ("O" "o" "�" "�" "J" "j" "�" "�" "0") do if "%st%"==%%A (GOTO OPTIONS)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)
goto newcard

:OPTIONS
COLOR 0E

cls
ECHO ------------------------------------------------------------------
ECHO               ======          Options           =====
ECHO ------------------------------------------------------------------
ECHO ------------------------------------------------------------------
ECHO           ======         Select Language          =====
ECHO           ======          �롥�� ��           =====
ECHO ------------------------------------------------------------------
ECHO.
ECHO         1.  ���᪨�
ECHO         2.  English
ECHO.
ECHO ==================================================================
ECHO                                                         Q.  Quit

set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (set lang=1)
for %%A in ("2") do if "%st%"==%%A (set lang=2)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)

cls
if %lang%==1 (
	ECHO --------------------------------------------------------------------
	ECHO                ======          Options           =====
	ECHO --------------------------------------------------------------------
	ECHO --------------------------------------------------------------------
	ECHO            ======          �롥�� CFW           =====
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO    �롨�� SXOS ⮫쪮, �᫨ �� �㯨�� �� ��� ᮡ�ࠥ���
	ECHO.
	ECHO           1. Atmosphere
	ECHO           2. SXOS
	ECHO           3. Both
	ECHO.
	ECHO ====================================================================
	ECHO                                                         Q.  Quit
) else (
	ECHO --------------------------------------------------------------------
	ECHO              ======          Options           =====
	ECHO --------------------------------------------------------------------
	ECHO --------------------------------------------------------------------
	ECHO             ======          Select CFW           =====
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO    Choose SXOS only if you bought it or will buy
	ECHO.
	ECHO           1. Atmosphere
	ECHO           2. SXOS
	ECHO           3. Both
	ECHO.
	ECHO ====================================================================
	ECHO                                                         Q.  Quit
)


set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (
	set cfw=ATMOS
	set cfwnum=1
	set cfwname=Atmosphere
)
for %%A in ("2") do if "%st%"==%%A (
	set cfw=SXOS
	set cfwnum=2
	set cfwname=SX OS     
)
for %%A in ("3") do if "%st%"==%%A (
	set cfw=BOTH
	set cfwnum=3
	set cfwname=both OSes 
)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)

if %cfwnum%==2 (goto opt)

:nosx
cls
ECHO --------------------------------------------------------------------
ECHO               ======          Options           =====
ECHO --------------------------------------------------------------------
if %lang%==1 (
	ECHO --------------------------------------------------------------------
	ECHO              ======     ����� ��⥬���� ��     =====
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO         1.  4.0.0 - 7.0.1
	ECHO         2.  8.0.0
	ECHO.
	ECHO ====================================================================
	ECHO                                                          Q.  ��室
) else (
	ECHO -------------------------------------------------
	ECHO              =====  OFW version =====
	ECHO -------------------------------------------------
	ECHO.
	ECHO         1.  4.0.0 - 7.0.1
	ECHO         2.  8.0.0
	ECHO.
	ECHO ==================================================
	ECHO                                          Q.  Quit
)
set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (set fw=0)
for %%A in ("2") do if "%st%"==%%A (set fw=1)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)

:opt
cls
ECHO --------------------------------------------------------------------
ECHO             ======          Options           =====
ECHO --------------------------------------------------------------------
if %lang%==1 (
	ECHO --------------------------------------------------------------------
	ECHO               ======     ��� ��⠭����     =====
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO         1.  ���筠�
	ECHO         2.  �����
	ECHO.
	ECHO --------------------------------------------------------------------
	ECHO  �ᯮ���� ����� ��⠭����, �᫨ �� ����᪥ ��⥬� �� ����砥�
	ECHO  �訡��. �� ��⮩ ��⠭���� �� 䠩�� � ����� �� ���� �����, 
	ECHO  �஬� ����� "Nintendo", ���� ��६�饭� �  ����� "backup"! �᫨ �
	ECHO  ����� "backup" ��� ��祣� �������, 㤠��� �� ������
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO ====================================================================
	ECHO                                                          Q.  ��室
) else (
	ECHO -------------------------------------------------
	ECHO           =====  Installation type =====
	ECHO -------------------------------------------------
	ECHO.
	ECHO         1.  General
	ECHO         2.  Clean
	ECHO.
	ECHO ==================================================
	ECHO                                          Q.  Quit
)
set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (set clear=0)
for %%A in ("2") do if "%st%"==%%A (set clear=1)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)
	
cls
ECHO ------------------------------------------------------------------
ECHO             ======          Options           =====
ECHO ------------------------------------------------------------------
if %lang%==1 (
	ECHO --------------------------------------------------------------------
	ECHO     ======     ����ன�� ��⠭���� ����㧮筮�� ��࠭�      =====
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO --------------------------------------------------------------------
	ECHO  ����㧮�� ��࠭ - �� ���⨭��, ���ன ��� ����砥� ����㧪� 
	ECHO  ��訢��. � ᡮ�� �室�� ����㧮�� ��࠭, �� ���஬ ����ᠭ�
	ECHO  ��� ᡮન. ��ᬮ���� �� ���� ����� � ९����ਨ ����.
	ECHO  �᫨ �� ���, �⮡� �� ��⠭����� ��� ����ਭ, �롥�� 1,
	ECHO  �᫨ ���, �⮡� ��⠫�� ��, �� � ��� ᥩ��, �롥�� 2. 
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO         1.  ��⠭����� ���� - ४���������
	ECHO         2.  ��⠢��� ⥪�騩
	ECHO.
	ECHO ====================================================================
	ECHO                                                         Q.  ��室
) else (
	ECHO --------------------------------------------------------------------
	ECHO            ======     Bootscreen setup settings      =====
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO --------------------------------------------------------------------
	ECHO  The boot screen is the picture that the firmware meets you with.
	ECHO  kefir includes a boot screen on which the build date is written.
	ECHO  You can look at it in the kefir's repository.
	ECHO --------------------------------------------------------------------
	ECHO.
	ECHO         1.  Install new - recomended
	ECHO         2.  Keep existing
	ECHO.
	ECHO ====================================================================
	ECHO                                                         Q.  Quit
)
set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (set bootscrn=1)
for %%A in ("2") do if "%st%"==%%A (set bootscrn=0)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)
	
:newcard
COLOR 0F
cls
if %lang%==1 (
	echo �롥�� ���� ����� ����� �� ᬮ��஢�����
) else (
	echo Choose mounted SD card letter
)

for /f "tokens=3-6 delims=: " %%a in ('WMIC LOGICALDISK GET FreeSpace^,Name^,Size^,filesystem^,description ^|FINDSTR /I "Removable" ^|findstr /i "exfat fat32"') do (@echo wsh.echo "Disk letter: %%c;" ^& " free: " ^& FormatNumber^(cdbl^(%%b^)/1024/1024/1024, 2^)^& " GB;"^& " size: " ^& FormatNumber^(cdbl^(%%d^)/1024/1024/1024, 2^)^& " GB;" ^& " FS: %%a" > %temp%\tmp.vbs & @if not "%%c"=="" @echo( & @cscript //nologo %temp%\tmp.vbs & del %temp%\tmp.vbs)
echo.
if %lang%==1 (
	set /P sd="������ �㪢� �� ���ன ᬮ��஢��� ���� �����: "
) else (
	set /P sd="Enter SD card letter: "
)

if not exist "%sd%:\" (
	if %lang%==1 (
		set word=    �� ����� %sd%:/ ���� ����� �� �������  
	) else (
		set word=        There is no SD card in %sd%-drive         
	)
	goto WRONGSD
) else (
	if not exist "%sd%:\*" (goto WRONGSD)
)
if exist "%sd%:\_backup" (goto chckbkp)
goto main

:chckbkp
cls
if %lang%==0 (
	ECHO --------------------------------------------------------------
	ECHO  Old backup folder was founded. Remove it? 
	ECHO  If you have any important files there, copy them right now!
	ECHO ---------------------------------------------------------------
	ECHO  ������� ���� ����� � �������, ᮧ������, ����⭮, �� 
	ECHO  ��⠭���� �����. ������������ �� 㤠����. �᫨ ⠬ ��⠫��� 
	ECHO  ����� 䠩��, ��७��� �� ��אַ ᥩ��!
	ECHO ---------------------------------------------------------------
	ECHO.
	ECHO         1.  Remove backup folder - recommended
	ECHO             ������� ����� backup - ४���������
	ECHO.
	ECHO         2.  Save backup folder
	ECHO             ��⠢��� ����� backup
	ECHO.
	ECHO ===============================================================
	ECHO                                                      Q.  Quit
) else (goto chckbkp1)
set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (goto rembkp)
for %%A in ("2") do if "%st%"==%%A (goto main)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)
goto main

:chckbkp1
if %lang%==1 (
	ECHO --------------------------------------------------------------
	ECHO  ������� ���� ����� � �������, ᮧ������, ����⭮, �� 
	ECHO  ��⠭���� �����. ������������ �� 㤠����. �᫨ ⠬ ��⠫��� 
	ECHO  ����� 䠩��, ��७��� �� ��אַ ᥩ��!
	ECHO --------------------------------------------------------------
	ECHO.
	ECHO         1.  ������� ����� backup - ४���������
	ECHO         2.  ��⠢��� ����� backup
	ECHO.
	ECHO.
	ECHO ==============================================================
	ECHO                                             Q.  ��室
) else (
	ECHO --------------------------------------------------------------
	ECHO  Old backup folder was founded. Remove it? 
	ECHO  If you have any important files there, copy them right now!
	ECHO --------------------------------------------------------------
	ECHO.
	ECHO         1.  Remove backup folder - recommended
	ECHO         2.  Save backup folder
	ECHO.
	ECHO.
	ECHO ==============================================================
	ECHO                                             Q.  Quit
)

set st=
set /p st=:

for %%A in ("1") do if "%st%"==%%A (goto rembkp)
for %%A in ("2") do if "%st%"==%%A (goto main)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)
goto main

:main
COLOR 0F

if not exist "%sd%:\" (goto WRONGSD)

cls
if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo                     �������� ���ॢ�� 䠩���
	echo.
	echo ------------------------------------------------------------------------
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                    Removing outdated files on sd
	echo.
	echo ------------------------------------------------------------------------
)

if exist "%sd%:\base" (RD /s /q  "%sd%:\base")
if exist "%sd%:\atmo" (RD /s /q  "%sd%:\atmo")
if exist "%sd%:\misc" (RD /s /q  "%sd%:\misc")
if exist "%sd%:\bootloader\ini\RajNX.ini" (del "%sd%:\bootloader\ini\RajNX.ini")
if exist "%sd%:\bootloader\ini\ReiNX.ini" (del "%sd%:\bootloader\ini\ReiNX.ini")
if exist "%sd%:\bootloader\payloads\rajnx_ipl.bin" (del "%sd%:\bootloader\payloads\rajnx_ipl.bin")
if exist "%sd%:\bootloader\payloads\ReiNX.bin" (del "%sd%:\bootloader\payloads\ReiNX.bin")
if exist "%sd%:\ReiNX\titles\010000000000100D" (RD /s /q "%sd%:\ReiNX\titles\010000000000100D")
if exist "%sd%:\hekate_ipl.ini" (del "%sd%:\hekate_ipl.ini")
if exist "%sd%:\rajnx_ipl.ini" (del "%sd%:\rajnx_ipl.ini")
if exist "%sd%:\bootlogo.bmp" (del "%sd%:\bootlogo.bmp")

if %clear%==1 (
	if not exist "%sd%:\_backup" (mkdir %sd%:\_backup\)
	FOR /d %%A IN (%sd%:\*) DO (
		IF "%%A" NEQ "%sd%:\Nintendo" IF "%%A" NEQ "%sd%:\_backup" (move /Y %%A %sd%:\_backup)
	)
	
	move /Y %sd%:\*.* %sd%:\_backup"
	
)

echo                               DONE
echo ------------------------------------------------------------------------
echo.
if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo          ��६�饭�� ����� LayeredFS ReiNX � ����� Atmosphere  
	echo.
	echo ------------------------------------------------------------------------
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo              Move ReiNX LayeredFS tiles to Atmosphere folder 
	echo.
	echo ------------------------------------------------------------------------
)

if exist "%sd%:\ReiNX\titles\010000000000100D" (RD /s /q "%sd%:\ReiNX\titles\010000000000100D")
if exist "%sd%:\ReiNX\titles" (xcopy %sd%:\ReiNX\titles\* %sd%:\atmosphere\titles\ /Y /S /E /H /R /D) >nul 2>&1
if exist "%sd%:\ReiNX" (RD /s /q "%sd%:\ReiNX")
if exist "%sd%:\RajNX" (RD /s /q "%sd%:\RajNX")

echo                               DONE
echo ------------------------------------------------------------------------
echo.
if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo                       �������� 䠩��� ��ண� ����
	echo.
	echo ------------------------------------------------------------------------
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                          Remove old pack files
	echo.
	echo ------------------------------------------------------------------------
)

if exist "%sd%:\atmosphere\exefs_patches" (RD /s /q "%sd%:\atmosphere\exefs_patches")
if exist "%sd%:\atmosphere\kip_patches" (RD /s /q "%sd%:\atmosphere\kip_patches")
if exist "%sd%:\atmosphere\hekate_kips" (RD /s /q "%sd%:\atmosphere\hekate_kips")
if exist "%sd%:\bootloader\debug" (RD /s /q "%sd%:\bootloader\debug")
if exist "%sd%:\modules" (RD /s /q "%sd%:\modules")
if exist "%sd%:\atmosphere\titles\0100000000000032" (RD /s /q "%sd%:\atmosphere\titles\0100000000000032")
if exist "%sd%:\atmosphere\titles\0100000000000034" (RD /s /q "%sd%:\atmosphere\titles\0100000000000034")
if exist "%sd%:\atmosphere\titles\0100000000000036" (RD /s /q "%sd%:\atmosphere\titles\0100000000000036")
if exist "%sd%:\atmosphere\titles\010000000000000D" (RD /s /q "%sd%:\atmosphere\titles\010000000000000D")
if exist "%sd%:\atmosphere\titles\010000000000100D" (RD /s /q "%sd%:\atmosphere\titles\010000000000100D")
if exist "%sd%:\atmosphere\titles\4200000000000010" (RD /s /q "%sd%:\atmosphere\titles\4200000000000010")
if exist "%sd%:\atmosphere\titles\420000000000000E" (RD /s /q "%sd%:\atmosphere\titles\420000000000000E")
if exist "%sd%:\atmosphere\titles\01FF415446660000" (RD /s /q "%sd%:\atmosphere\titles\01FF415446660000")
if exist "%sd%:\atmosphere\kips\fs_mitm.kip" (del "%sd%:\atmosphere\kips\fs_mitm.kip")
if exist "%sd%:\atmosphere\kips\ldn_mitm.kip" (del "%sd%:\atmosphere\kips\ldn_mitm.kip")
if exist "%sd%:\atmosphere\kips\loader.kip" (del "%sd%:\atmosphere\kips\loader.kip")
if exist "%sd%:\atmosphere\kips\pm.kip" (del "%sd%:\atmosphere\kips\pm.kip")
if exist "%sd%:\atmosphere\kips\sm.kip" (del "%sd%:\atmosphere\kips\sm.kip")
if exist "%sd%:\atmosphere\exosphere.bin" (del "%sd%:\atmosphere\exosphere.bin")
if exist "%sd%:\atmosphere\hbl.nsp" (del "%sd%:\atmosphere\hbl.nsp")
if exist "%sd%:\atmosphere\loader.ini" (del "%sd%:\atmosphere\loader.ini")
if exist "%sd%:\atmosphere\reboot_payload.bin" (del "%sd%:\atmosphere\reboot_payload.bin")
if exist "%sd%:\atmosphere\BCT.ini" (del "%sd%:\atmosphere\BCT.ini")
if exist "%sd%:\sxos\bootloader" (RD /s /q  "%sd%:\sxos\bootloader")
if exist "%sd%:\sxos\switch" (RD /s /q  "%sd%:\sxos\switch")
if exist "%sd%:\sept" (RD /s /q  "%sd%:\sept")
if exist "%sd%:\sxos\boot.dat" (del "%sd%:\sxos\boot.dat")
if exist "%sd%:\sxos\sxos" (
	xcopy %sd%:\sxos\sxos\* %sd%:\sxos\ /Y /S /E /H /R /D
)
if exist "%sd%:\atmosphere\fusee-secondary.bin" (del "%sd%:\atmosphere\fusee-secondary.bin")
if exist "%sd%:\bootloader\payloads\fusee-primary-payload.bin" (del "%sd%:\bootloader\payloads\fusee-primary-payload.bin")
if exist "%sd%:\bootloader\payloads\Lockpick_RCM.bin" (del "%sd%:\bootloader\payloads\Lockpick_RCM.bin")
if exist "%sd%:\bootloader\payloads\fusee-payload.bin" (del "%sd%:\bootloader\payloads\fusee-payload.bin")
if exist "%sd%:\bootloader\payloads\fusee-primary.bin" (del "%sd%:\bootloader\payloads\fusee-primary.bin")
if exist "%sd%:\bootloader\payloads\sxos.bin" (del "%sd%:\bootloader\payloads\sxos.bin")
if exist "%sd%:\bootloader\payloads\rajnx_ipl.bin" (del "%sd%:\bootloader\payloads\rajnx_ipl.bin")
if exist "%sd%:\fusee-secondary.bin" (del "%sd%:\fusee-secondary.bin")
if exist "%sd%:\atmosphere\fusee-secondary.bin" (del "%sd%:\atmosphere\fusee-secondary.bin")
if exist "%sd%:\bootloader\ini\Atmosphere.ini" (del "%sd%:\bootloader\ini\Atmosphere.ini")
if exist "%sd%:\bootloader\ini\atmosphere.ini" (del "%sd%:\bootloader\ini\atmosphere.ini")
if exist "%sd%:\bootloader\ini\!atmosphere.ini" (del "%sd%:\bootloader\ini\!atmosphere.ini")
if exist "%sd%:\bootloader\ini\sxos.ini" (del "%sd%:\bootloader\ini\sxos.ini")
if exist "%sd%:\bootloader\ini\!sxos.ini" (del "%sd%:\bootloader\ini\!sxos.ini")
if exist "%sd%:\bootloader\ini\RajNX.ini" (del "%sd%:\bootloader\ini\RajNX.ini")
if exist "%sd%:\bootloader\ini\!RajNX.ini" (del "%sd%:\bootloader\ini\!RajNX.ini")
if exist "%sd%:\bootloader\ini\For 1.0.0 users only!.ini" (del "%sd%:\bootloader\ini\For 1.0.0 users only!.ini")
if exist "%sd%:\license-request.dat" (del "%sd%:\license-request.dat")
if exist "%sd%:\boot.dat" (del "%sd%:\boot.dat")
if exist "%sd%:\hbmenu.nro" (del "%sd%:\hbmenu.nro")
if exist "%sd%:\keys.dat" (del "%sd%:\keys.dat")
if exist "%sd%:\BCT.ini" (del "%sd%:\BCT.ini")
if exist "%sd%:\hekate_ipl.ini" (del "%sd%:\hekate_ipl.ini")
if exist "%sd%:\bootloader\hekate_ipl.ini" (del "%sd%:\bootloader\hekate_ipl.ini")
if exist "%sd%:\hekate_ipl.ini" (del "%sd%:\hekate_ipl.ini")

if exist "%sd%:\switch\lithium" (RD /s /q "%sd%:\switch\lithium")
if exist "%sd%:\switch\tinfoil" (RD /s /q "%sd%:\switch\tinfoil")
rem if exist "%sd%:\switch\EdiZon.nro" (del "%sd%:\switch\EdiZon.nro")
if exist "%sd%:\switch\tinfoil\tinfoil.nro" (del "%sd%:\switch\tinfoil\tinfoil.nro")
if exist "%sd%:\switch\tinfoil\keys.txt" (del "%sd%:\switch\tinfoil\keys.txt")
if exist "%sd%:\switch\checkpoint.nro" (del "%sd%:\switch\checkpoint.nro")
if exist "%sd%:\switch\checkpoint\checkpoint.nro" (del "%sd%:\switch\checkpoint\checkpoint.nro")
if exist "%sd%:\switch\pplay.nro" (del "%sd%:\switch\pplay.nro")
if exist "%sd%:\switch\NX-SHELL.nro" (del "%sd%:\switch\NX-SHELL.nro")
if exist "%sd%:\switch\reboot_to_payload.nro" (del "%sd%:\switch\reboot_to_payload.nro")
if exist "%sd%:\switch\NxThemesInstaller.nro" (del "%sd%:\switch\NxThemesInstaller.nro")
if exist "%sd%:\switch\sx.nro" (del "%sd%:\switch\sx.nro")
if exist "%sd%:\switch\n1dus.nro" (del "%sd%:\switch\n1dus.nro")
if exist "%sd%:\switch\dbi.nro" (del "%sd%:\switch\dbi.nro")
if exist "%sd%:\switch\sx\locations.conf" (del "%sd%:\switch\sx\locations.conf")
if exist "%sd%:\switch\sx\sx.nro" (del "%sd%:\switch\sx\sx.nro")
if exist "%sd%:\switch\sx.nro" (del "%sd%:\switch\sx.nro")
if exist "%sd%:\switch\ultimate_updater.nro" (del "%sd%:\switch\ultimate_updater.nro")
if exist "%sd%:\switch\zerotwoxci.nro" (del "%sd%:\switch\zerotwoxci.nro")
if exist "%sd%:\switch\dOPUS.nro" (del "%sd%:\switch\dOPUS.nro")
if exist "%sd%:\switch\tinfoil.nro" (del "%sd%:\switch\tinfoil.nro")
if exist "%sd%:\switch\tinfoil_batch.nro" (del "%sd%:\switch\tinfoil_batch.nro")
if exist "%sd%:\switch\tinfoil_duckbill.nro" (del "%sd%:\switch\tinfoil_duckbill.nro")
if exist "%sd%:\switch\tinfoil_usb-fix.nro" (del "%sd%:\switch\tinfoil_usb-fix.nro")
if exist "%sd%:\switch\ldnmitm_config.nro" (del "%sd%:\switch\ldnmitm_config.nro")
if exist "%sd%:\switch\ldnmitm_config" (RD /s /q "%sd%:\switch\ldnmitm_config")

if %fw%==1 (goto rem_theme) else (goto install_pack)

:rem_theme
if exist "%sd%:\atmosphere\titles\0100000000001000" (mkdir %sd%:\_themebkp\0100000000001000)
if exist "%sd%:\atmosphere\titles\0100000000001000" (xcopy "%sd%:\atmosphere\titles\0100000000001000\*" "%sd%:\_themebkp\0100000000001000" /H /Y /C /R /S /E)
if exist "%sd%:\atmosphere\titles\0100000000001000" (RD /s /q "%sd%:\atmosphere\titles\0100000000001000")
if exist "%sd%:\switch\NxThemesInstaller.nro" (del "%sd%:\switch\NxThemesInstaller.nro")

:install_pack

if %lang%==1 (
	echo.
	echo                   ����஢���� ���� �� �६����� ����� 
	echo.
	echo ------------------------------------------------------------------------
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                    Copy pack files to temp directory 
	echo.
	echo ------------------------------------------------------------------------
)

if exist "%temp%\sdfiles\" (RD /s /q "%temp%\sdfiles\")
if not exist "%temp%\sdfiles\" (mkdir %temp%\sdfiles\)
if not exist "%temp%\sdfiles\atmo" (mkdir %temp%\sdfiles\atmo)
xcopy "%~dp0atmo" "%temp%\sdfiles\atmo" /H /Y /C /R /S /E >nul 2>&1
if not exist "%temp%\sdfiles\base" (mkdir %temp%\sdfiles\base)
xcopy "%~dp0base" "%temp%\sdfiles\base" /H /Y /C /R /S /E >nul 2>&1
if not exist "%temp%\sdfiles\misc" (mkdir %temp%\sdfiles\misc)
xcopy "%~dp0misc" "%temp%\sdfiles\misc" /H /Y /C /R /S /E >nul 2>&1
if not exist "%temp%\sdfiles\sxos" (mkdir %temp%\sdfiles\sxos)
xcopy "%~dp0sxos" "%temp%\sdfiles\sxos" /H /Y /C /R /S /E >nul 2>&1
copy "%~dp0payload.bin" "%temp%\sdfiles\payload.bin" >nul 2>&1
copy "%~dp0update_sdfiles.bat" "%temp%\sdfiles\update_sdfiles.bat" >nul 2>&1

if %bootscrn%==0 (
	if exist "%wd%\base\bootloader\bootlogo.bmp" (del "%wd%\base\bootloader\bootlogo.bmp")
)


echo                                 DONE
echo ------------------------------------------------------------------------
echo.
if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo                      ��⠭���� ���� �� ����� �����
	echo.
	echo ------------------------------------------------------------------------
	echo.
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                         Installing pack files 
	echo.
	echo ------------------------------------------------------------------------
	echo.
)
xcopy "%wd%\base\*" "%sd%:\" /H /Y /C /R /S /E
xcopy "%wd%\payload.bin" "%sd%:\" /H /Y /C /R
if exist "%sd%:\sdfiles.zip" (del "%sd%:\sdfiles.zip")

if exist "%sd%:\tinfoil\ticket" (RD /s /q "%sd%:\tinfoil\ticket")
if exist "%sd%:\tinfoil\extracted" (RD /s /q "%sd%:\tinfoil\extracted")
if exist "%sd%:\tinfoil" (
	move /Y %sd%:\tinfoil\nsp\* %sd%:\games
	move /Y %sd%:\tinfoil\xci %sd%:\games
	RD /s /q "%sd%:\tinfoil"
)

echo                               DONE
echo ------------------------------------------------------------------------
echo.
if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo                        ��⠭���� %cfwname% 
	echo.
	echo ------------------------------------------------------------------------
	echo.
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                        Installing %cfwname% 
	echo.
	echo ------------------------------------------------------------------------
	echo.
)

goto cfw_%cfw%

:cfw_ATMOS
xcopy "%wd%\atmo\*" "%sd%:\" /H /Y /C /R /S /E

if exist "%sd%:\boot.dat" (del "%sd%:\boot.dat")
if exist "%sd%:\bootloader\payloads\sxos.bin" (del "%sd%:\bootloader\payloads\sxos.bin")
if exist "%sd%:\bootloader\payloads\rajnx_ipl.bin" (del "%sd%:\bootloader\payloads\rajnx_ipl.bin")
if exist "%sd%:\switch\sx.nro" (del "%sd%:\switch\sx.nro")
if exist "%sd%:\bootloader\ini\sxos.ini" (del "%sd%:\bootloader\ini\sxos.ini")
if exist "%sd%:\bootloader\hekate_ipl_both.ini" (del "%sd%:\bootloader\hekate_ipl_both.ini")
if exist "%sd%:\bootloader\hekate_ipl_misc.ini" (del "%sd%:\bootloader\hekate_ipl_misc.ini")
if exist "%sd%:\bootloader\hekate_ipl_sx.ini" (del "%sd%:\bootloader\hekate_ipl_sx.ini")
if exist "%sd%:\bootloader\hekate_ipl_hm.ini" (del "%sd%:\bootloader\hekate_ipl_hm.ini")
if exist "%sd%:\bootloader\hekate_ipl_atmo.ini" (copy "%sd%:\bootloader\hekate_ipl_atmo.ini" "%sd%:\bootloader\hekate_ipl.ini")
if exist "%sd%:\bootloader\hekate_ipl_atmo.ini" (del "%sd%:\bootloader\hekate_ipl_atmo.ini")
if exist "%sd%:\sxos\games" (move /Y %sd%:\sxos\games\* %sd%:\games)
if exist "%sd%:\sxos" (RD /s /q "%sd%:\sxos")

goto cfw_DONE


:cfw_SXOS

xcopy "%wd%\sxos\*" "%sd%:\" /H /Y /C /R /S /E
if exist "%sd%:\bootloader\payloads\fusee-primary.bin" (del "%sd%:\bootloader\payloads\fusee-primary.bin")
if exist "%sd%:\bootloader\payloads\rajnx_ipl.bin" (del "%sd%:\bootloader\payloads\rajnx_ipl.bin")
if exist "%sd%:\bootloader\ini\atmosphere.ini" (del "%sd%:\bootloader\ini\atmosphere.ini")
if exist "%sd%:\atmosphere\titles\0100000000000032" (RD /s /q "%sd%:\atmosphere\titles\0100000000000032")
if exist "%sd%:\atmosphere\titles\0100000000000034" (RD /s /q "%sd%:\atmosphere\titles\0100000000000034")
if exist "%sd%:\atmosphere\titles\0100000000000036" (RD /s /q "%sd%:\atmosphere\titles\0100000000000036")
if exist "%sd%:\atmosphere\titles" (xcopy %sd%:\atmosphere\titles\* %sd%:\sxos\titles\  /Y /S /E /H /R /D)
if exist "%sd%:\atmosphere" (RD /s /q "%sd%:\atmosphere")
if exist "%sd%:\config" (RD /s /q "%sd%:\config")
if exist "%sd%:\switch\ftpd.nro" (del "%sd%:\switch\ftpd.nro")
if exist "%sd%:\switch\n1dus.nro" (del "%sd%:\switch\n1dus.nro")
if exist "%sd%:\switch\dbi.nro" (del "%sd%:\switch\dbi.nro")
if exist "%sd%:\switch\tinfoil_batch.nro" (del "%sd%:\switch\tinfoil_batch.nro")
if exist "%sd%:\hbmenu.nro" (del "%sd%:\hbmenu.nro")
if exist "%sd%:\bootloader\hekate_ipl_both.ini" (del "%sd%:\bootloader\hekate_ipl_both.ini")
if exist "%sd%:\bootloader\hekate_ipl_misc.ini" (del "%sd%:\bootloader\hekate_ipl_misc.ini")
if exist "%sd%:\bootloader\hekate_ipl_atmo.ini" (del "%sd%:\bootloader\hekate_ipl_atmo.ini")
if exist "%sd%:\bootloader\hekate_ipl_hm.ini" (del "%sd%:\bootloader\hekate_ipl_hm.ini")
if exist "%sd%:\bootloader\hekate_ipl_sx.ini" (copy "%sd%:\bootloader\hekate_ipl_sx.ini" "%sd%:\bootloader\hekate_ipl.ini")
if exist "%sd%:\bootloader\hekate_ipl_sx.ini" (del "%sd%:\bootloader\hekate_ipl_sx.ini")
if exist "%sd%:\switch\tinfoil" (RD /s /q "%sd%:\switch\tinfoil")

goto cfw_DONE

:cfw_BOTH
xcopy "%wd%\atmo\*" "%sd%:\" /H /Y /C /R /S /E
xcopy "%wd%\sxos\*" "%sd%:\" /H /Y /C /R /S /E
if exist "%sd%:\bootloader\payloads\rajnx_ipl.bin" (del "%sd%:\bootloader\payloads\rajnx_ipl.bin")
if exist "%sd%:\bootloader\hekate_ipl_atmo.ini" (del "%sd%:\bootloader\hekate_ipl_atmo.ini")
if exist "%sd%:\bootloader\hekate_ipl_misc.ini" (del "%sd%:\bootloader\hekate_ipl_misc.ini")
if exist "%sd%:\bootloader\hekate_ipl_sx.ini" (del "%sd%:\bootloader\hekate_ipl_sx.ini")
if exist "%sd%:\bootloader\hekate_ipl_hm.ini" (del "%sd%:\bootloader\hekate_ipl_hm.ini")
if exist "%sd%:\bootloader\hekate_ipl_both.ini" (copy "%sd%:\bootloader\hekate_ipl_both.ini" "%sd%:\bootloader\hekate_ipl.ini")
if exist "%sd%:\bootloader\hekate_ipl_both.ini" (del "%sd%:\bootloader\hekate_ipl_both.ini")

goto cfw_DONE

:cfw_DONE

echo                               DONE
echo ------------------------------------------------------------------------
echo.

if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo                    ��⠭���� ��ਡ�⮢ 䠩��� � ����� 
	echo.
	echo ------------------------------------------------------------------------
	echo.
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                             Fix atributes 
	echo.
	echo ------------------------------------------------------------------------
	echo.
)

if exist "%sd%:\atmosphere" (
	attrib -A /S /D %sd%:\atmosphere\*
	attrib -A %sd%:\atmosphere)
if exist "%sd%:\sept" (
	attrib -A /S /D %sd%:\sept\*
	attrib -A %sd%:\sept)
if exist "%sd%:\bootloader" (
	attrib -A /S /D %sd%:\bootloader\*
	attrib -A %sd%:\bootloader)
if exist "%sd%:\config" (
	attrib -A /S /D %sd%:\config\*
	attrib -A %sd%:\config)
if exist "%sd%:\switch" (
	attrib -A /S /D %sd%:\switch\*
	attrib -A %sd%:\switch)
if exist "%sd%:\tinfoil" (
	attrib -A /S /D %sd%:\tinfoil\*
	attrib -A %sd%:\tinfoil)
if exist "%sd%:\games" (
	attrib -A /S /D %sd%:\games\*
	attrib -A %sd%:\games)
if exist "%sd%:\themes" (
	attrib -A /S /D %sd%:\themes\*
	attrib -A %sd%:\themes)
if exist "%sd%:\_backup" (
	attrib -A /S /D %sd%:\_backup\*
	attrib -A %sd%:\_backup)
if exist "%sd%:\hbmenu.nro" (attrib -A %sd%:\hbmenu.nro)
if exist "%sd%:\keys.dat" (attrib -A %sd%:\keys.dat)
if exist "%sd%:\payload.bin" (attrib -A %sd%:\payload.bin)
if exist "%sd%:\sxos" (
	attrib -A /S /D %sd%:\sxos\*
	attrib -A %sd%:\sxos)


echo                               DONE
echo.
echo ------------------------------------------------------------------------
echo.

cls
COLOR 0A
echo.
if %lang%==1 (
	echo ========================================================================
	echo.
	echo             ��� ��⮢�! ��⠢�� ����� ����� � ���⠢��!
	echo.
	echo ========================================================================
	echo ========================================================================
	echo.
	echo              �᫨ �� ����᪥ ���⠢�� �� ����� �訡��,
	echo       �த����� ��⠭���� ���� �� ࠧ, ��ࠢ ����� ��⠭����!
	echo.
	echo ========================================================================
	echo ========================================================================
	echo.
) else (
	echo ========================================================================
	echo.
	echo                  DONE! Insert you SD to console!
	echo.
	echo ========================================================================
	echo ========================================================================
	echo.
	echo             If you got an error after lauching console,
	echo          install pack one more time but choose clean install!
	echo.
	echo ========================================================================
	echo ========================================================================
	echo.
)

goto end

:WRONGSD
cls
COLOR C

		set word=    �� ����� %sd%:/ ���� ����� �� �������  
	) else (
		set word=        There is no SD card in drive %sd%:/        


if %lang%==0 (
	ECHO ----------------------------------------------------------
	ECHO ======            Choosed SD letter is: %sd%:/            =====
	ECHO ======               ��࠭�� ���: %sd%:/               =====
	ECHO.
	ECHO ======     �� ����� %sd%:/ ���� ����� �� �������     =====
	ECHO ======       There is no SD card in drive %sd%:/        =====
	ECHO ----------------------------------------------------------
	ECHO.
	ECHO          ��������, �� 㪠���� �ࠢ����� �㪢� ��᪠
	ECHO. 
	ECHO            1.  The card letter is correct
	ECHO                �㪢� ��᪠ 㪠���� ��୮
	ECHO.
	ECHO            2.  Choose another card letter
	ECHO                ����� ����� �㪢� ��᪠
	ECHO.
	ECHO ==========================================================
	ECHO                                              Q.  ��室
	ECHO.

set st=
set /p st=:

for %%A in ("N" "n" "2" "�" "�") do if "%st%"==%%A (GOTO newcard)
for %%A in ("Y" "y" "1" "�" "�") do if "%st%"==%%A (GOTO main)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)

) else (goto wrongsd1)

:wrongsd1
if %lang%==1 (
	ECHO ----------------------------------------------------------
	ECHO ======              �� ��ࠫ� ��� %sd%:/              =====
	ECHO. 
	ECHO ====== %word%   =====
	ECHO ----------------------------------------------------------
	ECHO.
	ECHO       ��������, �� 㪠���� �ࠢ����� �㪢� ��᪠
	ECHO.
	ECHO         1.  �㪢� ��᪠ 㪠���� ��୮
	ECHO         2.  ����� ����� �㪢� ��᪠
	ECHO.
	ECHO ==========================================================
	ECHO                                              Q.  ��室
	ECHO.
) else (
	ECHO ----------------------------------------------------------
	ECHO ======               You choosed: %sd%:/                =====
	ECHO. 
	ECHO ======%word%=====
	ECHO ----------------------------------------------------------
	ECHO.
	ECHO       Make sure that you set correct SD card letter
	ECHO.
	ECHO         1.  The card letter is correct
	ECHO         2.  Choose another card letter
	ECHO.
	ECHO ==========================================================
	ECHO                                              Q.  Quit
	ECHO.
)

set st=
set /p st=:

for %%A in ("N" "n" "2" "�" "�") do if "%st%"==%%A (GOTO newcard)
for %%A in ("Y" "y" "1" "�" "�") do if "%st%"==%%A (GOTO main)
for %%A in ("Q" "q" "�" "�") do if "%st%"==%%A (GOTO END)

:rembkp
if %lang%==1 (
	echo ------------------------------------------------------------------------
	echo.
	echo                      �������� ����� _backup
	echo                            �������!
	echo.
	echo ------------------------------------------------------------------------
) else (
	echo ------------------------------------------------------------------------
	echo.
	echo                      Removing _backup folder
	echo                           Please wait!
	echo.
	echo ------------------------------------------------------------------------
)

RD /s /q "%sd%:\_backup"
goto main

:END
if %lang%==1 (
	echo. 
	echo ������ ���� ������� ��� ��室�
) else (
	echo. 
	echo Press any button for exit
)

RD /s /q "%wd%
pause>nul 2>&1
if exist "%sd%:\update_sdfiles.bat" (del "%sd%:\update_sdfiles.bat")
exit