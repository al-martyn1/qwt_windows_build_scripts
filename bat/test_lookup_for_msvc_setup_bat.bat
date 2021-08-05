@set SELF_PATH=%~dp0

@call %SELF_PATH%\lookup_for_msvc_setup_bat.bat 2017
echo Path to MSVC2017 Setup Bat file - %VSDEVCMD_BAT% 

@call %SELF_PATH%\lookup_for_msvc_setup_bat.bat 2019
echo Path to MSVC2019 Setup Bat file - %VSDEVCMD_BAT% 

