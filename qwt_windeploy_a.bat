@rem Usage : qwt_windeploy.bat  Toolset  Platform  Configuration DeployDestinationPath
@rem Sample: qwt_windeploy.bat  msvc2017 x64       Debug         F:\tmp3\MyApp

@rem Copy this file along the path that is registered in PATH environment variable


@if "%QWT_INSTALL_ROOT%" NEQ "" goto QWT_INSTALL_ROOT_IS_SET
