

:QWT_INSTALL_ROOT_IS_SET
@if "%QWT_NAME_VERSION%" NEQ "" goto QWT_NAME_VERSION_IS_SET
@set QWT_NAME_VERSION=Qwt-6.2.0

:QWT_NAME_VERSION_IS_SET


@set QWT_TOOLSET=%1
@set QWT_PLATFORM=%2
@set QWT_CONFIGURATION=%3
@set QWT_DEPLOY_TARGET_PATH=%4

@set QWT_DLL_BASE_NAME=qwt
@set QWT_DLL_EXT=dll


@if "%QWT_DEPLOY_TARGET_PATH%"=="" set QWT_DEPLOY_TARGET_PATH=.


@if "%QWT_TOOLSET%"=="mingw73"   goto TOOLSET_MINGW73
@if "%QWT_TOOLSET%"=="mingw81"   goto TOOLSET_MINGW81
@if "%QWT_TOOLSET%"=="msvc2017"  goto TOOLSET_MSVC2017
@if "%QWT_TOOLSET%"=="msvc2019"  goto TOOLSET_MSVC2019

@echo qwt_windeploy: Toolset not taken or taken toolset is invalid/unsupported
@goto USAGE


:TOOLSET_MINGW73
@set QWT_QT_NAME_VERSION=qt-5.14.2
@goto TOOLSET_DONE

:TOOLSET_MINGW81
@set QWT_QT_NAME_VERSION=qt-5.15.2
@goto TOOLSET_DONE

:TOOLSET_MSVC2017
@set QWT_QT_NAME_VERSION=qt-5.14.2
@goto TOOLSET_DONE

:TOOLSET_MSVC2019
@set QWT_QT_NAME_VERSION=qt-5.15.2
@goto TOOLSET_DONE


:TOOLSET_DONE
@rem Toolset is done here


@if "%QWT_PLATFORM%"=="x86"   goto PLATFORM_X86
@if "%QWT_PLATFORM%"=="x64"   goto PLATFORM_X64

@echo qwt_windeploy: Platform not taken or taken platform is invalid/unsupported
@goto USAGE


:PLATFORM_X86
:PLATFORM_X64
@rem Platform is done here


@if "%QWT_CONFIGURATION%"=="Debug"     goto CONFIGURATION_DEBUG
@if "%QWT_CONFIGURATION%"=="Release"   goto CONFIGURATION_RELEASE

@echo qwt_windeploy: Configuration not taken or taken configuration is invalid/unsupported
@goto USAGE


:CONFIGURATION_DEBUG  
@set QWT_DLL_NAME=%QWT_DLL_BASE_NAME%d.%QWT_DLL_EXT%
@goto CONFIGURATION_DONE

:CONFIGURATION_RELEASE
@set QWT_DLL_NAME=%QWT_DLL_BASE_NAME%.%QWT_DLL_EXT%
@goto CONFIGURATION_DONE

:CONFIGURATION_DONE
@rem Configuration is done here


@set QWT_LIB_FULL_PATH_NAME=%QWT_INSTALL_ROOT%\%QWT_NAME_VERSION%\%QWT_QT_NAME_VERSION%\%QWT_TOOLSET%\%QWT_PLATFORM%\lib\%QWT_DLL_NAME%

@echo QWT version: %QWT_NAME_VERSION%

@echo QWT Library: %QWT_LIB_FULL_PATH_NAME%
@if not exist %QWT_LIB_FULL_PATH_NAME% goto QWT_LIB_NOT_EXIST
@rem echo QWT Library exist
@goto QWT_LIB_EXIST_DONE

:QWT_LIB_NOT_EXIST
@echo QWT Library not exist
@goto USAGE


:QWT_LIB_EXIST_DONE

@rem Create target folder here
@if not exist "%QWT_DEPLOY_TARGET_PATH%" mkdir "%QWT_DEPLOY_TARGET_PATH%"

@if exist "%QWT_DEPLOY_TARGET_PATH%" goto TARGET_PATH_EXIST
@echo qwt_windeploy: Failed to create deploy destination path: "%QWT_DEPLOY_TARGET_PATH%"
@goto USAGE


:TARGET_PATH_EXIST
@copy /B /Y %QWT_LIB_FULL_PATH_NAME% "%QWT_DEPLOY_TARGET_PATH%\"


:QWT_DEPLOY_DONE
@exit /b 0




:USAGE
@echo Usage : qwt_windeploy.bat Toolset Platform Configuration DeployDestinationPath
@echo   where
@echo     Toolset                 - mingw73, mingw81, msvc2017 or msvc2019
@echo     Platform                - x86 or x64
@echo     Configuration           - x86 or x64
@echo     DeployDestinationPath   - may be empty, in this case current dir will be used ('.' path)
@exit /b 1


