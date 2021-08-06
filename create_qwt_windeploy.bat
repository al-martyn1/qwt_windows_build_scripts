@set SELF_PATH=%~dp0

@call %SELF_PATH%\make_qwt_install_root.bat

@set QWT_INSTALL_ROOT_NORMALIZED=%QWT_INSTALL_ROOT:/=\%

@echo @set QWT_INSTALL_ROOT=%QWT_INSTALL_ROOT_NORMALIZED%>%SELF_PATH%\qwt_windeploy_b.bat

@copy /Y %SELF_PATH%\qwt_windeploy_a.bat^
+%SELF_PATH%\qwt_windeploy_b.bat^
+%SELF_PATH%\qwt_windeploy_c.bat^
 %QWT_INSTALL_ROOT_NORMALIZED%\qwt_windeploy.bat

@copy /Y %SELF_PATH%\test_qwt_windeploy.bat %QWT_INSTALL_ROOT_NORMALIZED%\