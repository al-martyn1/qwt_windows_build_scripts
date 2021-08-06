cd ..
@set SELF_PATH=%~dp0
@call %SELF_PATH%\make_msvc_log.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\make_mingw_log.bat
cd qwt_windows_build_scripts

