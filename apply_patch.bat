@set SELF_PATH=%~dp0
@call %SELF_PATH%\configure_diff.bat

@rem %PATCH% --help > patch.txt

@rem -l  --ignore-whitespace
@rem -u  --unified  Interpret the patch as a unified difference.

@set PATCH_FILE=%SELF_PATH%\qwtconfig.pri.patch
@set PATCHED_FILE=%SELF_PATH%\..\qwtconfig.pri

@rem copy /Y qwtconfig.pri.org %PATCHED_FILE%

%DOS2UNIX% %PATCHED_FILE%
%DOS2UNIX% %PATCH_FILE%

%PATCH% -lu %PATCHED_FILE% %PATCH_FILE%

%UNIX2DOS% %PATCHED_FILE%

