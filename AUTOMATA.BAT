@echo off
setlocal enabledelayedexpansion
title AUTOMATA.BAT - DEBLOAT TOOL FOR LEGACY ANDROID

:START
cls
echo ==========================================
echo              AUTOMATA.BAT
echo ==========================================
echo      DEBLOAT TOOL FOR LEGACY ANDROID
echo       ONLY FOR SKT / KT / LG U+
echo ==========================================
echo              DEVICE LIST
echo ==========================================

set count=0
for /f "skip=1 tokens=1" %%i in ('adb devices') do (
    if not "%%i"=="" (
        set /a count+=1
        set "device[!count!]=%%i"
        echo [!count!] %%i
    )
)

if %count%==0 (
    echo NO DEVICE - CHECK CABLE
    pause
    goto START
)

echo ==========================================
set /p choice="WHICH ONE? -> "

set TARGET_DEVICE=!device[%choice%]!

if "%TARGET_DEVICE%"=="" (
    echo WRONG NUMBER.
    pause
    goto START
)

echo.
echo [SELECTED: %TARGET_DEVICE%]
echo.
echo ==========================================
echo              SELECT CARRIER
echo ==========================================
echo [1] SKT
echo [2] KT
echo [3] LG U+
echo ==========================================
set /p carrier="CARRIER? -> "

if "%carrier%"=="1" goto SKT
if "%carrier%"=="2" goto KT
if "%carrier%"=="3" goto LGU
echo WRONG NUMBER.
pause
goto START

:: ==========================================
:: SKT - SK Telecom
:: ==========================================
:SKT
echo.
echo [SKT] Processing...
echo.

adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.sktelecom.tguard
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.sktelecom.minit
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.skaf.OA00018282
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.skaf.OA00199800
::adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.skaf.l001f00002
::adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.tservice
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.tservice.utility_lge
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.t_smart_charge
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.prod
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.PROD
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.android.sktpay
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.skaf.OA00056282
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.nate
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.RDiagno
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.RInstallAgent
::adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.rsupport.phonetophone.host.skt.lge
::adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.tbmon
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lge.sktlogservice
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lge.sktgnsstest
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.hps20client
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.sktelecom.membership
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.android.sktmembership
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.aifriends.aos
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.android.newspack
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.validity.fingerservice.skt
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.skt.skaf.A000Z00040

goto DONE

:: ==========================================
:: KT - Korea Telecom
:: ==========================================
:KT
echo.
echo [KT] Processing...
echo.

adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.olleh.storefront
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.olleh.smartsearch
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.wibro
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.cs.buzcall
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.serviceagent
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.apps.android.launcher
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.service.fota
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.olleh.wifi
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.wifiauto
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.wifi.autologin
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.olleh.mobiletvon
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.olleh.music
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.olleh.skylife
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.fido.securetouch
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.rsupport.phonetophone.host.kt
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.rsupport.rs.activity.kt
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.diag
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.membership
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.android.m_membership
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.clip
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.gigagenie.phone
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.secsvc
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.kt.android.n_shopping

goto DONE

:: ==========================================
:: LG U+ - LG Uplus
:: ==========================================
:LGU
echo.
echo [LG U+] Processing...
echo.

adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.cs
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.customer
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.lguplusstore
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.contentstore
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.uplushdtv
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.uplustv
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.lguplusmovie
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.uplusmusic
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.membership
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.uplusmembership
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.rsupport.phonetophone.host.lguplus
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.devicediag
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lge.uplus.logservice
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lge.gnsstest.uplus
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.gnsstest
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.mobilesecurity
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.security
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.shopping
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.upluspage
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.recommendservice
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.smarthome
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.upluspush
adb -s %TARGET_DEVICE% shell pm uninstall -k --user 0 com.lguplus.mobile.fota

goto DONE

:: ==========================================
:DONE
echo.
echo DONE
echo ==========================================
echo              TROUBLE SHOOT
echo ==========================================
echo Failure - not installed for 0: CHECK APP
echo IS INSTALLED.
echo App not deleted: REPORT ISSUE
echo ==========================================
pause
goto START
