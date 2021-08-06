@set SELF_PATH=%~dp0

@call %SELF_PATH%\bat\setup_output_root.bat

@call %SELF_PATH%\make_qwt_install_root.bat


if "%MINGW73_QTROOT%"=="" goto TRY_MINGW81

:TRY_MINGW73

@echo !!! Building MinGW 7.3 x86
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         mingw73 x86

@echo !!! Building MinGW 7.3 x64
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         mingw73 x64


:TRY_MINGW81

if "%MINGW81_QTROOT%"=="" goto TRY_END

@echo !!! Building MinGW 8.1 x86
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         mingw81 x86

@echo !!! Building MinGW 8.1 x64
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         mingw81 x64


:TRY_END

@set SELF_PATH=%~dp0
@call %SELF_PATH%\create_qwt_windeploy.bat
