@rem Usage: setup_plugin_file_name.bat %CONFIGURATION%
@set QCAN_PLUGIN_NAME=unknown_configuration_%CONFIGURATION%
@if "%1"=="Release" set QCAN_PLUGIN_NAME=qtqcanbus
@if "%1"=="Debug"   set QCAN_PLUGIN_NAME=qtqcanbusd


