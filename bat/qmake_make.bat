@set SELF_PATH=%~dp0

@rem %1 - target name
@rem %2 - pro file
@rem %3 - toolset
@rem %4 - platform

@set TARGET=%1
@set TOOLSET=%3
@set PLATFORM=%4

@call %SELF_PATH%\setup_toolset_platform_config.bat %3 %4

@set PATH=%QT_PLATFORM_TOOLSET_BIN%;%PATH%

@set QMAKE_CXXFLAGS_WARN_OFF=
@set QMAKE_CXXFLAGS_WARN_ON=

@rem call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat unknown-warning 
@call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat unused-parameter
@call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat unused-variable
@call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat unused-value
@call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat unused-but-set-variable
@call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat cast-function-type
@call %SELF_PATH%\QMAKE_CXXFLAGS_WARN_OFF.bat multichar

@rem DIR (DESTDIR, UI_DIR, RCC_DIR, OBJECTS_DIR, etc.).
@rem $$OUT_PWD

@if "%QWT_INSTALL_ROOT%" NEQ "" goto QWT_INSTALL_ROOT_TAKEN
@set QWT_INSTALL_ROOT=D:/Qwt
:QWT_INSTALL_ROOT_TAKEN


@rem https://renenyffenegger.ch/notes/Windows/dirs/Program-Files-x86/Microsoft-Visual-Studio/version/edition/Common7/Tools/VsDevCmd_bat
@rem VsDevCmd -arch=amd64
@rem VsDevCmd -arch=x86

@set SETUP_TOOLSET_BAT_ARG_ARCH=

@if "%PLATFORM%"=="x86" goto PATFORM_X86
@if "%PLATFORM%"=="x64" goto PATFORM_X64
@echo Platform not taken
@exit /b 1


:PATFORM_X86
@set SETUP_TOOLSET_BAT_ARG_ARCH=-arch=x86
@goto PATFORM_END

:PATFORM_X64
@set SETUP_TOOLSET_BAT_ARG_ARCH=-arch=amd64
@goto PATFORM_END

:PATFORM_END


@set SETUP_TOOLSET_BAT=

@if "%TOOLSET%"=="msvc2017" goto TOOLSET_MSVC2017
@if "%TOOLSET%"=="msvc2019" goto TOOLSET_MSVC2019
@if "%TOOLSET%"=="mingw73"  goto TOOLSET_MINGW73
@if "%TOOLSET%"=="mingw81"  goto TOOLSET_MINGW81
@echo Unknown toolset name
@exit /b 1





:TOOLSET_MSVC2017
@call "%SELF_PATH%\lookup_for_msvc_setup_bat.bat" 2017
@set SETUP_TOOLSET_BAT=%VSDEVCMD_BAT%
@goto TOOLSET_MSVC_COMMON


:TOOLSET_MSVC2019
@call "%SELF_PATH%\lookup_for_msvc_setup_bat.bat" 2019
@set SETUP_TOOLSET_BAT=%VSDEVCMD_BAT%
@goto TOOLSET_MSVC_COMMON


:TOOLSET_MSVC_COMMON
@set MAKE=nmake.exe 
@rem /D
@set QMAKE_CXX_WARNS=
@rem /F %TARGET%
@goto RUN_QMAKE


:TOOLSET_MINGW73
:TOOLSET_MINGW81
@set MAKE=%QT_MINGW_MAKE% 
@rem --file=%TARGET%
@set QMAKE_CXX_WARNS="QMAKE_CXXFLAGS_WARN_OFF -= %QMAKE_CXXFLAGS_WARN_OFF%" "QMAKE_CXXFLAGS_WARN_ON  += %QMAKE_CXXFLAGS_WARN_ON%"
@goto RUN_QMAKE


:RUN_QMAKE
@echo.
@echo ------------------------------
@echo Target - %1 - %3 %4

@set SAVED_CUR_DIR=%CD%
md %QMAKE_OUTPUT_ROOT%
cd %QMAKE_OUTPUT_ROOT%
@echo.
@rem echo Saved DIR: %cd%
@echo Saved DIR: %SAVED_CUR_DIR%
@echo Current DIR:
cd



@rem %QMAKE% "OBJECTS_DIR=_%1" "MOC_DIR=_%1" "QMAKE_CXXFLAGS_WARN_OFF -= -Wunused-parameter -Wunused-variable -Wunused-value -Wunused-but-set-variable" "QMAKE_CXXFLAGS_WARN_ON  += -Wno-unused-parameter -Wno-unused-variable -Wno-unused-value -Wno-unused-but-set-variable" -o %QMAKE_OUTPUT_ROOT%\%1 %2
@rem echo QMAKE_CXXFLAGS_WARN_OFF = %QMAKE_CXXFLAGS_WARN_OFF%
@rem echo QMAKE_CXXFLAGS_WARN_ON  = %QMAKE_CXXFLAGS_WARN_ON%
if exist "%SETUP_TOOLSET_BAT%" call "%SETUP_TOOLSET_BAT%" %SETUP_TOOLSET_BAT_ARG_ARCH%
@set QMAKE_INSTALL_ROOT="QWT_INSTALL_ROOT=%QWT_INSTALL_ROOT%"
@set QMAKE_TOOLSET_PLATFORM="TOOLSET_PLATFORM=%TOOLSET%_%PLATFORM%"
@set QMAKE_DIRS="OBJECTS_DIR=_%1/obj" "MOC_DIR=_%1/_moc" "UI_DIR=_%1/_uic" "RCC_DIR=_%1/_RCC"

@set QMAKE_MISC=
@rem "CONFIG -= silent"

@rem 
%QMAKE% -nocache %QMAKE_INSTALL_ROOT% %QMAKE_TOOLSET_PLATFORM% %QMAKE_DIRS% %QMAKE_CXX_WARNS% %QMAKE_MISC% ..\..\..\%2
@rem -o %1
@rem 
@rem #DESTDIR=


:BUILD


@rem %QT_MINGW_MAKE% --file=%1.%5

%MAKE% && %MAKE% install


@rem clean all
@cd %SAVED_CUR_DIR%



:END