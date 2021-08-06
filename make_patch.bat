@set SELF_PATH=%~dp0
@call %SELF_PATH%\configure_diff.bat

@rem -w, --ignore-all-space          ignore all white space

@rem -u, -U NUM, --unified[=NUM]   output NUM (default 3) lines of unified context

@rem -r, --recursive                 recursively compare any subdirectories found
@rem     --no-dereference            don't follow symbolic links

@rem -N, --new-file                  treat absent files as empty
@rem     --unidirectional-new-file   treat absent first files as empty
@rem     --ignore-file-name-case     ignore case when comparing file names
@rem     --no-ignore-file-name-case  consider case when comparing file names

@rem -a, --text                      treat all files as text
@rem     --strip-trailing-cr         strip trailing carriage return on input
@rem     --binary                    read and write data in binary mode


@rem %DIFF% --help > diff.txt
%DIFF% -Nurw %1 %2 > %SELF_PATH%\qwtconfig.pri.patch
@rem -Naur
