@set SELF_PATH=%~dp0

@call %SELF_PATH%\bat\setup_output_root.bat

@rem https://ss64.com/nt/setlocal.html
@rem https://ss64.com/nt/endlocal.html

@call %SELF_PATH%\make_qwt_install_root.bat


if "%MSVC2017_QTROOT%"=="" goto TRY_MSVC2019

:TRY_MSVC2017

@SETLOCAL
@echo !!! Building MSVC 2017 x86
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         msvc2017 x86
@ENDLOCAL

@rem exit /b 0

@SETLOCAL
@echo !!! Building MSVC 2017 x64
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         msvc2017 x64
@ENDLOCAL


:TRY_MSVC2019

if "%MSVC2019_QTROOT%"=="" goto TRY_END

@SETLOCAL
@echo !!! Building MSVC 2019 x86
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         msvc2019 x86
@ENDLOCAL

@SETLOCAL
@echo !!! Building MSVC 2019 x64
@set SELF_PATH=%~dp0
@call %SELF_PATH%\clean_out.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\bat\qmake_make.bat qwt       ../qwt.pro         msvc2019 x64
@ENDLOCAL

:TRY_END


