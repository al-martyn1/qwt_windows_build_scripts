@rem call setup-qt.bat

@echo QCAN_QTROOT - %QCAN_QTROOT%
@echo QCAN_QTVER  - %QCAN_QTVER%
@echo QTROOT - %QTROOT%
@echo QTVER  - %QTVER%

@echo ---
@echo Testing without OUTPUT_ROOT set
@call setup_toolset_platform_config.bat msvc2014 x86 Release


@set OUTPUT_ROOT=_out

@echo ---
@echo Testing without params
@call setup_toolset_platform_config.bat

@echo ---
@echo Testing with params - msvc2014 x86 Release
@call setup_toolset_platform_config.bat msvc2014 x86 Release

@echo ---
@echo Testing with params - msvc2017 x86 Release
@call setup_toolset_platform_config.bat msvc2017 x86 Release
@echo QT_PLATFORM_SUBPATH  - %QT_PLATFORM_SUBPATH%
@echo QT_PLATFORM_ROOT     - %QT_PLATFORM_ROOT%
@echo WINDEPLOYQT_CONFIGURATION_OPTION - %WINDEPLOYQT_CONFIGURATION_OPTION%
@echo WINDEPLOYQT          - %WINDEPLOYQT%
@echo OUTPUT_ROOT          - %OUTPUT_ROOT%
@echo TOOLSET              - %TOOLSET%
@echo PLATFORM             - %PLATFORM%
@echo CONFIGURATION        - %CONFIGURATION%
@echo PLATFORM_OUTPUT_ROOT - %PLATFORM_OUTPUT_ROOT%
@echo OUTDIR               - %OUTDIR%

@echo ---
@echo Testing with params - msvc2017 x64 Debug
@call setup_toolset_platform_config.bat msvc2017 x64 Debug
@echo QT_PLATFORM_SUBPATH  - %QT_PLATFORM_SUBPATH%
@echo QT_PLATFORM_ROOT     - %QT_PLATFORM_ROOT%
@echo WINDEPLOYQT_CONFIGURATION_OPTION - %WINDEPLOYQT_CONFIGURATION_OPTION%
@echo WINDEPLOYQT          - %WINDEPLOYQT%
@echo OUTPUT_ROOT          - %OUTPUT_ROOT%
@echo TOOLSET              - %TOOLSET%
@echo PLATFORM             - %PLATFORM%
@echo CONFIGURATION        - %CONFIGURATION%
@echo PLATFORM_OUTPUT_ROOT - %PLATFORM_OUTPUT_ROOT%
@echo OUTDIR               - %OUTDIR%

@echo ---
@echo Testing with params - mingw73 x86 Debug
@call setup_toolset_platform_config.bat mingw73 x86 Debug
@echo QT_PLATFORM_SUBPATH  - %QT_PLATFORM_SUBPATH%
@echo QT_PLATFORM_ROOT     - %QT_PLATFORM_ROOT%
@echo WINDEPLOYQT_CONFIGURATION_OPTION - %WINDEPLOYQT_CONFIGURATION_OPTION%
@echo WINDEPLOYQT          - %WINDEPLOYQT%
@echo OUTPUT_ROOT          - %OUTPUT_ROOT%
@echo TOOLSET              - %TOOLSET%
@echo PLATFORM             - %PLATFORM%
@echo CONFIGURATION        - %CONFIGURATION%
@echo PLATFORM_OUTPUT_ROOT - %PLATFORM_OUTPUT_ROOT%
@echo OUTDIR               - %OUTDIR%
@echo QT_MINGW_MAKE        - %QT_MINGW_MAKE%
@echo QMAKE                - %QMAKE%

@echo ---
@echo Testing with params - mingw73 x64 Debug
@call setup_toolset_platform_config.bat mingw73 x64 Debug
@echo QT_PLATFORM_SUBPATH  - %QT_PLATFORM_SUBPATH%
@echo QT_PLATFORM_ROOT     - %QT_PLATFORM_ROOT%
@echo WINDEPLOYQT_CONFIGURATION_OPTION - %WINDEPLOYQT_CONFIGURATION_OPTION%
@echo WINDEPLOYQT          - %WINDEPLOYQT%
@echo OUTPUT_ROOT          - %OUTPUT_ROOT%
@echo TOOLSET              - %TOOLSET%
@echo PLATFORM             - %PLATFORM%
@echo CONFIGURATION        - %CONFIGURATION%
@echo PLATFORM_OUTPUT_ROOT - %PLATFORM_OUTPUT_ROOT%
@echo OUTDIR               - %OUTDIR%
@echo QT_MINGW_MAKE        - %QT_MINGW_MAKE%
@echo QMAKE                - %QMAKE%

@echo ---
@echo Testing with params - mingw81 x86 Release
@call setup_toolset_platform_config.bat mingw81 x86 Release
@echo QT_PLATFORM_SUBPATH  - %QT_PLATFORM_SUBPATH%
@echo QT_PLATFORM_ROOT     - %QT_PLATFORM_ROOT%
@echo WINDEPLOYQT_CONFIGURATION_OPTION - %WINDEPLOYQT_CONFIGURATION_OPTION%
@echo WINDEPLOYQT          - %WINDEPLOYQT%
@echo OUTPUT_ROOT          - %OUTPUT_ROOT%
@echo TOOLSET              - %TOOLSET%
@echo PLATFORM             - %PLATFORM%
@echo CONFIGURATION        - %CONFIGURATION%
@echo PLATFORM_OUTPUT_ROOT - %PLATFORM_OUTPUT_ROOT%
@echo OUTDIR               - %OUTDIR%
@echo QT_MINGW_MAKE        - %QT_MINGW_MAKE%
@echo QMAKE                - %QMAKE%

@echo ---
@echo Testing with params - mingw81 x64 Release
@call setup_toolset_platform_config.bat mingw81 x64 Release
@echo QT_PLATFORM_SUBPATH  - %QT_PLATFORM_SUBPATH%
@echo QT_PLATFORM_ROOT     - %QT_PLATFORM_ROOT%
@echo WINDEPLOYQT_CONFIGURATION_OPTION - %WINDEPLOYQT_CONFIGURATION_OPTION%
@echo WINDEPLOYQT          - %WINDEPLOYQT%
@echo OUTPUT_ROOT          - %OUTPUT_ROOT%
@echo TOOLSET              - %TOOLSET%
@echo PLATFORM             - %PLATFORM%
@echo CONFIGURATION        - %CONFIGURATION%
@echo PLATFORM_OUTPUT_ROOT - %PLATFORM_OUTPUT_ROOT%
@echo OUTDIR               - %OUTDIR%
@echo QT_MINGW_MAKE        - %QT_MINGW_MAKE%
@echo QMAKE                - %QMAKE%

