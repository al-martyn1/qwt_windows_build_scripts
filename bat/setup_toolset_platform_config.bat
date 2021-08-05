@rem %1 - toolset name, eg msvc2017
@rem %2 - platform name, eg x86 or x64
@rem %3 - configuration name, eg Debug or Release


@if "%1" == "" goto USAGE_EXIT
@if "%2" == "" goto USAGE_EXIT
@rem if "%3" == "" goto USAGE_EXIT
@if "%OUTPUT_ROOT%" == "" goto USAGE_EXIT


@if "%1"=="msvc2017" goto TOOLSET_MSVC2017
@if "%1"=="msvc2019" goto TOOLSET_MSVC2019
@if "%1"=="mingw73"  goto TOOLSET_MINGW73
@if "%1"=="mingw81"  goto TOOLSET_MINGW81
@echo Invalid toolset specified - %1
@rem The system cannot find the path specified. Indicates that the specified path cannot be found.
call :USAGE && exit /B 3



:TOOLSET_MSVC2017
@set TOOLSET=%1
@set QTROOT=%MSVC2017_QTROOT%
@set QMAKE_SPEC=-spec win32-msvc
@goto CHECK_PALTFORM_MSVC

:TOOLSET_MSVC2019
@set TOOLSET=%1
@set QTROOT=%MSVC2019_QTROOT%
@set QMAKE_SPEC=-spec win32-msvc
@goto CHECK_PALTFORM_MSVC

@rem 5.14.2
:TOOLSET_MINGW73
@set TOOLSET=%1
@set QTROOT=%MINGW73_QTROOT%
@set QMAKE_SPEC=-spec win32-g++
@goto CHECK_PALTFORM_MINGW

@rem 5.15.2
:TOOLSET_MINGW81
@set TOOLSET=%1
@set QTROOT=%MINGW81_QTROOT%
@set QMAKE_SPEC=-spec win32-g++
@goto CHECK_PALTFORM_MINGW



:CHECK_PALTFORM_MSVC

@if "%2"=="x86" goto PALTFORM_X86_MSVC
@if "%2"=="x64" goto PALTFORM_X64_MSVC
@echo Invalid platform specified - %2
@rem The system cannot find the path specified. Indicates that the specified path cannot be found.
call :USAGE && exit /B 3

:PALTFORM_X86_MSVC
@set QT_PLATFORM_SUBPATH=%TOOLSET%
@goto PLATFORM_CHECK_DONE

:PALTFORM_X64_MSVC
@set QT_PLATFORM_SUBPATH=%TOOLSET%_64
@goto PLATFORM_CHECK_DONE



:CHECK_PALTFORM_MINGW

@if "%2"=="x86" goto PALTFORM_X86_MINGW
@if "%2"=="x64" goto PALTFORM_X64_MINGW
@echo Invalid platform specified - %2
call :USAGE && exit /B 3

:PALTFORM_X86_MINGW
@set QT_PLATFORM_SUBPATH=%TOOLSET%_32
@set QT_PLATFORM_TOOLSET_SUBPATH=..\Tools\%TOOLSET%0_32
@goto PLATFORM_MINGW_CHECK_DONE

:PALTFORM_X64_MINGW
@set QT_PLATFORM_SUBPATH=%TOOLSET%_64
@set QT_PLATFORM_TOOLSET_SUBPATH=..\Tools\%TOOLSET%0_64
@goto PLATFORM_MINGW_CHECK_DONE


:PLATFORM_MINGW_CHECK_DONE
@set QT_PLATFORM_TOOLSET_ROOT=%QTROOT%\%QT_PLATFORM_TOOLSET_SUBPATH%
@set QT_PLATFORM_TOOLSET_BIN=%QTROOT%\%QT_PLATFORM_TOOLSET_SUBPATH%\bin
@set QT_MINGW_MAKE=%QT_PLATFORM_TOOLSET_BIN%\mingw32-make.exe


@goto PLATFORM_CHECK_DONE



:PLATFORM_CHECK_DONE
@set QT_PLATFORM_ROOT=%QTROOT%\%QT_PLATFORM_SUBPATH%
@set PLATFORM=%2
@set PLATFORM_OUTPUT_ROOT=%OUTPUT_ROOT%\%TOOLSET%\%PLATFORM%


@if "%3"=="Release" goto CONFIGURATION_RELEASE
@if "%3"=="Debug"   goto CONFIGURATION_DEBUG
@goto CONFIGURATION_DEBUG_RELEASE_UNSPECIFIED

@rem echo Invalid configuration specified - %3
@rem The system cannot find the path specified. Indicates that the specified path cannot be found.
call :USAGE && exit /B 3

:CONFIGURATION_DEBUG
@set WINDEPLOYQT_CONFIGURATION_OPTION=--debug
@goto CONFIGURATION_COMMON

:CONFIGURATION_RELEASE
@set WINDEPLOYQT_CONFIGURATION_OPTION=--release
@goto CONFIGURATION_COMMON


:CONFIGURATION_DEBUG_RELEASE_UNSPECIFIED


:CONFIGURATION_COMMON
@set CONFIGURATION=%3
@set OUTDIR=%PLATFORM_OUTPUT_ROOT%\%CONFIGURATION%
@set QMAKE="%QT_PLATFORM_ROOT%\bin\qmake.exe" %QMAKE_SPEC%
@set QMAKE_OUTPUT_ROOT=%OUTPUT_ROOT%\%TOOLSET%\%PLATFORM%
@set WINDEPLOYQT="%QT_PLATFORM_ROOT%\bin\windeployqt.exe" %WINDEPLOYQT_CONFIGURATION_OPTION%
@set DEPLOY_PATH=%DEPLOY_ROOT%\%TOOLSET%\%PLATFORM%\%CONFIGURATION%
@goto END


:USAGE
@echo Usage: setup_toolset_platform_config.bat toolset platform configuration
@echo Where
@echo   toolset       - Toolset Name, eg msvc2017
@echo   platform      - Platform Name, eg x86 or x64
@echo   configuration - Configuration Name, eg Debug or Release
@echo OUTPUT_ROOT environment variable must set up before calling this bat file
@exit /B

:USAGE_EXIT
@call :USAGE
@exit /B 1

:END
@exit /B 0
