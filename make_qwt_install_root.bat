@if "%QWT_INSTALL_ROOT%" NEQ "" goto QWT_INSTALL_ROOT_IS_SET
@rem Set default value
@set QWT_INSTALL_ROOT=D:/Qwt

:QWT_INSTALL_ROOT_IS_SET

@if exist set_qwt_install_root.bat call set_qwt_install_root.bat

@if not exist %QWT_INSTALL_ROOT% mkdir %QWT_INSTALL_ROOT%

