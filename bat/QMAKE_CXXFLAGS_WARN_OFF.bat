@set QMAKE_CXXFLAGS_WARN_OFF=%QMAKE_CXXFLAGS_WARN_OFF% -W%1

@if "%1"=="cast-function-type" goto END
@if "%1"=="unknown-warning" goto END

@set QMAKE_CXXFLAGS_WARN_ON=%QMAKE_CXXFLAGS_WARN_ON% -Wno-%1

:END