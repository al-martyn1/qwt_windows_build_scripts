cd ..
@set SELF_PATH=%~dp0
@call %SELF_PATH%\make_msvc.bat
@set SELF_PATH=%~dp0
@call %SELF_PATH%\make_mingw.bat
cd qwt_windows_build_scripts

