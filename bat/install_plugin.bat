@rem Find more here - http://wiki.dep111.rtc.local/tools:qcan

@echo Installing plugins

@if "%MSVC2017_QTROOT%"=="" goto TRY_MSVC2019

@set QTROOT=%MSVC2017_QTROOT%

@echo Installing plugins for MSVC 2017 to %QTROOT%

@set OUTPUT_ROOT=%~dp0
@echo Installing from %OUTPUT_ROOT%

@call "%~dp0\bat\install_plugin_single_config.bat" msvc2017 x86 Release
@call "%~dp0\bat\install_plugin_single_config.bat" msvc2017 x86 Debug
@call "%~dp0\bat\install_plugin_single_config.bat" msvc2017 x64 Release
@call "%~dp0\bat\install_plugin_single_config.bat" msvc2017 x64 Debug


:TRY_MSVC2019

@if "%MSVC2019_QTROOT%"=="" goto TRY_MINGW

@set QTROOT=%MSVC2019_QTROOT%

@echo Installing plugins for MSVC 2019 to %QTROOT%

@set OUTPUT_ROOT=%~dp0
@echo Installing from %OUTPUT_ROOT%

@call "%~dp0\bat\install_plugin_single_config.bat" msvc2019 x86 Release
@call "%~dp0\bat\install_plugin_single_config.bat" msvc2019 x86 Debug
@call "%~dp0\bat\install_plugin_single_config.bat" msvc2019 x64 Release
@call "%~dp0\bat\install_plugin_single_config.bat" msvc2019 x64 Debug


:TRY_MINGW
:TRY_MINGW73

@if "%MINGW73_QTROOT%"=="" goto TRY_MINGW81

@set QTROOT=%MINGW73_QTROOT%

@echo Installing plugins for MinGW 7.3 to %QTROOT%

@set OUTPUT_ROOT=%~dp0
@echo Installing from %OUTPUT_ROOT%

@call "%~dp0\bat\install_plugin_single_config.bat" mingw73 x86 Release
@call "%~dp0\bat\install_plugin_single_config.bat" mingw73 x86 Debug
@call "%~dp0\bat\install_plugin_single_config.bat" mingw73 x64 Release
@call "%~dp0\bat\install_plugin_single_config.bat" mingw73 x64 Debug


:TRY_MINGW81

@if "%MINGW81_QTROOT%"=="" goto END

@set QTROOT=%MINGW81_QTROOT%

@echo Installing plugins for MinGW 7.3 to %QTROOT%

@set OUTPUT_ROOT=%~dp0
@echo Installing from %OUTPUT_ROOT%

@call "%~dp0\bat\install_plugin_single_config.bat" mingw81 x86 Release
@call "%~dp0\bat\install_plugin_single_config.bat" mingw81 x86 Debug
@call "%~dp0\bat\install_plugin_single_config.bat" mingw81 x64 Release
@call "%~dp0\bat\install_plugin_single_config.bat" mingw81 x64 Debug



:END

@rem exit /B

