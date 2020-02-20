@echo off
rem ---------------------------------------------------------------------------
rem Project definition.
rem ---------------------------------------------------------------------------
set TEAMNAME=obd-vancouver
set BUILDSTRATEGY=BridgeEnterpriseSuite;PRG

rem ---------------------------------------------------------------------------
rem Set title for console.
rem ---------------------------------------------------------------------------
title OBD shell (NON-BOOTSTRAPPED, run `new` to bootstrap)

rem ---------------------------------------------------------------------------
rem Set path variables.
rem ---------------------------------------------------------------------------
set THISPATH=%~d0%~p0
set BSISRC=%THISPATH%src\
set BSIOUT=%THISPATH%out\

rem ---------------------------------------------------------------------------
rem Calling a custom shared shell environment.
rem ---------------------------------------------------------------------------
if exist %BSISRC%bsicommon\shell\SharedShellEnv.bat ((call %BSISRC%bsicommon\shell\SharedShellEnv.bat) ^& (cd /d %BSISRC%) ^& (title OBD shell))

rem ---------------------------------------------------------------------------
rem Project environment variables.
rem ---------------------------------------------------------------------------
rem set BEGTEST_RUN_MINIMIZED=1
set DEBUG=1
rem set USE_NEW_BB=1
set BB_INSTALLER_SKIP_WIXBUNDLE_INSIGNIA=1
rem set BE_SUITE_BUILD=1

set OBM_FOR_OBD_PATH=d:\bsw\OBM_obm-release-for-obd\out\Winx64\Product\OpenBridgeModeler\OpenBridgeModeler\OpenBridgeModeler.exe
rem set LBC_FOR_OBD_PATH=d:\bsw\LEAPBridgeConcreteSuite_LeapBridge\out\Winx64\Product\LEAPBridgeConcreteCONS\LEAPBridgeConcreteCONS.exe


rem set REL_V=11
rem set MAJ_V=01
rem set MIN_V=00
rem set SUBMIN_V=01


rem ---------------------------------------------------------------------------
rem Project environment doskeys.
rem ---------------------------------------------------------------------------
doskey new=if not exist %BSISRC%bsicommon\shell\SharedShellEnv.bat (mkdir %BSISRC% ^& cd /d %BSISRC% ^& bentleybootstrap.py %TEAMNAME% ^& (call %BSISRC%bsicommon\shell\SharedShellEnv.bat)^& (title OBD shell)) else (echo Already bootstrapped!)
doskey pull=(bb pull)
doskey build=(bb -ax86 build)
doskey buildx64=(bb build)
doskey installer=(bb buildinstallset -c)
doskey installerfull=(bb bundlebuild get ^& bb bundlebuild build)
doskey clean=if exist %OutRoot% (rmdir /s /q %OutRoot%) else (echo Directory doesn't exist)
doskey obd=%THISPATH%out\Winx64\Product\OpenBridgeDesigner\OpenBridgeDesigner.exe

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsDevCmd.bat"
