@rem Find more here - http://wiki.dep111.rtc.local/tools:qcan

@echo Deploying Qt

@set DEPLOY_ROOT=%~dp0
@set OUTPUT_ROOT=%~dp0

@set APP_QT_MODULES=--core --gui --widgets --serialbus --serialport




:TRY_MSVC2017
@if "%MSVC2017_QTROOT%"=="" goto TRY_MSVC2019

@set QTROOT=%MSVC2017_QTROOT%
@echo Deploying Qt to MSVC 2017 Applications

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2017 x86 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2017 x86 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2017 x64 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2017 x64 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe




:TRY_MSVC2019
@if "%MSVC2019_QTROOT%"=="" goto TRY_MINGW

@set QTROOT=%MSVC2019_QTROOT%
@echo Deploying Qt to MSVC 2019 Applications

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2019 x86 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2019 x86 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2019 x64 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" msvc2019 x64 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe




:TRY_MINGW
:TRY_MINGW73
@if "%MINGW73_QTROOT%"=="" goto TRY_MINGW81

@set QTROOT=%MINGW73_QTROOT%
@echo Deploying Qt to MinGW 7.3 Applications

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw73 x86 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw73 x86 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw73 x64 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw73 x64 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe




:TRY_MINGW81
@if "%MINGW81_QTROOT%"=="" goto END

@set QTROOT=%MINGW81_QTROOT%
@echo Deploying Qt to MinGW 8.1 Applications

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw81 x86 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw81 x86 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw81 x64 Debug
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe

@call "%~dp0\bat\setup_toolset_platform_config.bat" mingw81 x64 Release
%WINDEPLOYQT% %APP_QT_MODULES% %DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%\can.exe




:END

