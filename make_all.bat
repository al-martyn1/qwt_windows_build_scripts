@set SELF_PATH=%~dp0
cd ..
@call %SELF_PATH%\make_msvc.bat
@call %SELF_PATH%\make_mingw.bat
cd qwt_windows_build_scripts