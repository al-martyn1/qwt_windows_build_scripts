@if "%DIFF%" NEQ "" goto DIFF_IS_SET
@set DIFF="C:\Program Files\Git\usr\bin\diff.exe" 
:DIFF_IS_SET

@if "%PATCH%" NEQ "" goto PATCH_IS_SET
@set PATCH="C:\Program Files\Git\usr\bin\patch.exe" 
:PATCH_IS_SET

@if "%DOS2UNIX%" NEQ "" goto DOS2UNIX_IS_SET
@set DOS2UNIX="C:\Program Files\Git\usr\bin\dos2unix.exe" 
:DOS2UNIX_IS_SET

@if "%UNIX2DOS%" NEQ "" goto UNIX2DOS_IS_SET
@set UNIX2DOS="C:\Program Files\Git\usr\bin\unix2dos.exe" 
:UNIX2DOS_IS_SET

