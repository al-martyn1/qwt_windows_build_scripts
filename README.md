# Scripts to build QWT/Windows for MinGW and MSVC


Download QWT archive or clone it to the local drive - https://qwt.sourceforge.io/

Direct link to download latest qwt-6.2.0.zip - 
  https://sourceforge.net/projects/qwt/files/qwt/6.2.0/qwt-6.2.0.zip/download

Read installation instructions - https://qwt.sourceforge.io/qwtinstall.html

Unpack qwt-6.2.0.zip to anywhere - e.g. D:\Temp\qwt-6.2.0

Go to D:\Temp\qwt-6.2.0

Execute `git clone https://github.com/al-martyn1/qwt_windows_build_scripts.git`

Go to D:\Temp\qwt-6.2.0\qwt_windows_build_scripts

Run 'apply_patch.bat' bat file

Set up environment variables pointing to various Qt versions,
which are installed on your computer.

Qt folders tree example:
(installed Qt 5.14.2: MingGW 7.3 - x86/x64, MSVC 2017 - x86/x64; 
              5.15.2: MingGW 8.1 - x86/x64, MSVC 2019 - x86/x64)

    D:\Qt\
        5.14.2\
            mingw73_32
            mingw73_64
            msvc2017
            msvc2017_64
            Src
        5.15.2\
            mingw81_32
            mingw81_64
            msvc2019
            msvc2019_64
            Src
        dist
        Docs
        Examples
        installerResources
        Licenses
        Tools
        vcredist
        ...

So, you need to create next environment variables:

    MINGW73_QTROOT=D:\Qt\5.14.2
    MINGW81_QTROOT=D:\Qt\5.15.2
    MSVC2017_QTROOT=D:\Qt\5.14.2
    MSVC2019_QTROOT=D:\Qt\5.15.2

If you haven't some versions of Qt, simple not define such environment variable.
Build scripts automatically builds only required versions of QWT.


Configure QWT installation path:

  1) Rename set_qwt_install_root.bat.template to set_qwt_install_root.bat and write your path in this file

  2) Set up QWT_INSTALL_ROOT environmetn variable 
  
  3) Or, keep all as is, than D:/Qwt will be applied by default

  *Note: use slashes '/' as path separator, not normal windows path separator '\'

Run make_all.bat or make_all_log.bat (last one writes all output to log file instead of console)


Now, QWT was built and installed, you can use it.


You have next QWT folders tree:

    D:\Qwt\
        Qwt-6.2.0\
            qt-5.14.2\
                mingw73\
                    x64\
                        doc
                        features
                        include
                        lib
                        plugins
                    x86\
                        ...
                msvc2017\
                    x64\
                        ...
                    x86
                        ...
            qt-5.15.2\
                mingw81\
                    x64\
                        ...
                    x86
                        ...
                msvc2019\
                    x64\
                        ...
                    x86
                        ...


So, set up next environment variables:

    MINGW73_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.14.2\mingw73
    MINGW81_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2017
    MSVC2017_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.14.2\mingw81
    MSVC2019_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2019

For MSVC - create file 'qt.props' (example is for MSVC2017):


    <Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    
      <PropertyGroup>
        <QTROOT>$(MSVC2017_QTROOT)</QTROOT>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
        <QTDIR>$(QTROOT)\msvc2017</QTDIR>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
        <QTDIR>$(QTROOT)\msvc2017</QTDIR>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
        <QTDIR>$(QTROOT)\msvc2017_64</QTDIR>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
        <QTDIR>$(QTROOT)\msvc2017_64</QTDIR>
      </PropertyGroup>
    
      <PropertyGroup>
        <QWT_ROOT>$(MSVC2017_QWT_ROOT)</QWT_ROOT>
        <QWT_LIB>$(QWT_ROOT)\$(PlatformShortName)\lib</QWT_LIB>
        <QWT_INC>$(QWT_ROOT)\$(PlatformShortName)\include</QWT_INC>
      </PropertyGroup>
    
    </Project>



In MSVC project file (.vcxproj) find line such next:

    <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />


Add next line after that:

    <Import Project="$(ProjectDir)\qt.props" />

Now you can use $(QWT_LIB) and $(QWT_INC) macros in all project settings.


