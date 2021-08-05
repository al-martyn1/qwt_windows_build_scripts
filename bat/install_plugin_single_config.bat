@call "%~dp0\setup_toolset_platform_config.bat" %1 %2 %3
@call "%~dp0\setup_plugin_file_name.bat" %3
@set QT_CANBUS_PLUGINS_PATH=%QT_PLATFORM_ROOT%\plugins\canbus
copy /Y "%OUTDIR%\%QCAN_PLUGIN_NAME%.dll" "%QT_CANBUS_PLUGINS_PATH%\"
if exist "%OUTDIR%\%QCAN_PLUGIN_NAME%.pdb" copy /Y "%OUTDIR%\%QCAN_PLUGIN_NAME%.pdb" "%QT_CANBUS_PLUGINS_PATH%\"

