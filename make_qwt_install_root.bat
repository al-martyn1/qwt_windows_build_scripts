@set SELF_PATH=%~dp0

@if "%QWT_INSTALL_ROOT%" NEQ "" goto QWT_INSTALL_ROOT_IS_SET
@set QWT_INSTALL_ROOT=D:/Qwt

:QWT_INSTALL_ROOT_IS_SET

@if exist %SELF_PATH%\set_qwt_install_root.bat call %SELF_PATH%\set_qwt_install_root.bat

@if not exist %QWT_INSTALL_ROOT:/=\% mkdir %QWT_INSTALL_ROOT:/=\%

