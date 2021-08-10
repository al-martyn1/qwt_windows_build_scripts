# Scripts to build QWT/Windows for MinGW and MSVC

Applied to Qt 5.14.2 MingGW 7.3/MSVC 2017 and to Qt 5.15.2 MingGW 8.1/MSVC 2019



## Downloading QWT

Download QWT archive or clone it to the local drive - https://qwt.sourceforge.io/

Direct link to download latest `qwt-6.2.0.zip` - 
  https://sourceforge.net/projects/qwt/files/qwt/6.2.0/qwt-6.2.0.zip/download

Read installation instructions - https://qwt.sourceforge.io/qwtinstall.html

Unpack `qwt-6.2.0.zip` to anywhere - e.g. `D:\Temp\qwt-6.2.0`



## Downloading/cloning this build scripts

Go to `D:\Temp\qwt-6.2.0`

    cd D:\Temp\qwt-6.2.0


Execute `git clone https://github.com/al-martyn1/qwt_windows_build_scripts.git`


Go to `D:\Temp\qwt-6.2.0\qwt_windows_build_scripts`

    cd qwt_windows_build_scripts


Run `apply_buil_config_patch.bat` bat file to apply required build configuration changes



## Setting up the environment

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

  1) Rename `set_qwt_install_root.bat.template` to `set_qwt_install_root.bat` and write your path in this file

  2) Or, set up QWT_INSTALL_ROOT environmetn variable 
  
  3) Or, keep all as is, than `D:/Qwt` will be applied by default


---

**Note:**
Use slashes '/' as path separator, instead of normal windows path separator '\\'

---




## Building and installing QWT

Run make_all.bat or make_all_log.bat (last one writes all output to log file instead of console)


---

**Note:**
Building all configurations of QWT requires lot of time, maybe a few hours on a slow computer

---


After all build scripts are done you have got the `qwt_windeploy.bat` in the QWT_INSTALL_ROOT folder

Copy it to the folder that is listed in the PATH environment variable. Or, if you wish, you can add
the QWT_INSTALL_ROOT folder to the PATH environment variable



## Using QWT

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


So, set up the next environment variables:

    MINGW73_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.14.2\mingw73
    MINGW81_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.15.2\mingw81
    MSVC2017_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.14.2\msvc2017
    MSVC2019_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2019



## Using QWT with MSVC

Create the file `qt.props` (example is for MSVC2017):


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


In MSVC project file (.vcxproj) find the line such next:

    <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />


Add next line after that found:

    <Import Project="$(ProjectDir)\qt.props" />

Now you can use $(QWT_LIB) and $(QWT_INC) macros in all project settings.



## Using QWT with Qt Creator/qmake

Create the file `qwt.pri`:

    win32-msvc* {
    
        MSVC_VER = $$(VisualStudioVersion)
    
        equals(MSVC_VER, 15.0){
            QWT_ROOT=$$(MSVC2017_QWT_ROOT)
        }
        equals(MSVC_VER, 16.0){
            QWT_ROOT=$$(MSVC2019_QWT_ROOT)
        }
    
        QWT_PLATFORM=x86
        contains(QMAKE_TARGET.arch, x86_64):QWT_PLATFORM=x64
    
    }
    
    win32-g++* {
    
        QWT_ROOT=$$(MINGW81_QWT_ROOT)
    
        lessThan(QT_GCC_MAJOR_VERSION, 8): QWT_ROOT=$$(MINGW73_QWT_ROOT)
    
        QWT_PLATFORM=x86
        contains(QMAKE_TARGET.arch, x86_64):QWT_PLATFORM=x64
    
    }
    
    
    QWT_INCLUDE_PATH=$${QWT_ROOT}/$${QWT_PLATFORM}/include
    QWT_LIB_PATH=$${QWT_ROOT}/$${QWT_PLATFORM}/lib


    win32:CONFIG(release, debug|release): QWT_LIB=qwt
    else:win32:CONFIG(debug, debug|release): QWT_LIB=qwtd


In your QMAKE project file `qwt_sample.pro` add the next lines:

    include(qwt.pri)

    INCLUDEPATH += $${QWT_INCLUDE_PATH}

    LIBS += -L$${QWT_LIB_PATH} -l$${QWT_LIB}


Now you can build your app with Qt 5.14.2 MingGW 7.3/MSVC 2017 or Qt 5.15.2 MingGW 8.1/MSVC 2019.


## Deploying the QWT library binaries with your application

If the `qwt_windeploy.bat` batch file is placed in path listed in your PATH environment variable
you can call it from your deploy script as is:

    call qwt_windeploy.bat Toolset Platform Configuration DeployDestinationPath

where `Toolset Platform Configuration DeployDestinationPath` params can be:

    Toolset                 - mingw73, mingw81, msvc2017 or msvc2019
    Platform                - x86 or x64
    Configuration           - Debug or Release
    DeployDestinationPath   - may be empty, in this case current dir will be used ('.' path)




## Installing QWT plugin to Qt Creator

Read Qt Designer plugins installation notes - https://doc.qt.io/qtcreator/adding-plugins.html

In my Qt installation, Qt Creator is located in D:\Qt\Tools\QtCreator folder.

In my Qt installation Qt Creator (4.14.0) was built with MSVC2019, x64 (Qt 5.15.2),
so required for QtCreator QWT plugin binary located in D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2019\x64\plugins\designer folder.

Version of Qt Creator you can find in 'Help/About Qt Creator' dialog.

Target QWT plugin folder for QtCreator is: D:\Qt\Tools\QtCreator\bin\plugins\designer.

You can simple copy QWT plugin to that folder:

    copy /Y %MSVC2019_QWT_ROOT%\x64\plugins\designer\qwt_designer_plugin.dll D:\Qt\Tools\QtCreator\bin\plugins\designer
    copy /Y %MSVC2019_QWT_ROOT%\x64\lib\qwt.dll                              D:\Qt\Tools\QtCreator\bin\plugins\designer

But we recomend install it from Qt Creator:

  * Go to 'Help/About Plugins' menu item in Qt Creator
  * In 'Installed Plugings' dialog push the 'Install Plugin' button
  * Browse to 'D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2019\x64\plugins\designer' folder and select 'qwt_designer_plugin.dll'
  * Copy %MSVC2019_QWT_ROOT%\x64\lib\qwt.dll to D:\Qt\Tools\QtCreator\lib\qtcreator\plugins folder
  * Enjoy it



## Installing QWT plugin to Qt Designer

Will be written later


D:\Qt\Tools\QtCreator\ 

 \bin\plugins\designer 


D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2019\x64\plugins\designer\qwt_designer_plugin.dll


D:\Qt\Tools\QtCreator\bin\plugins\designer\



D:\Qt\5.14.2\msvc2017\plugins\designer\ 


D:\Qt\5.14.2\msvc2017\bin



    MSVC2017_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.14.2\msvc2017
    MSVC2019_QWT_ROOT=D:\Qwt\Qwt-6.2.0\qt-5.15.2\msvc2019


