@echo off
setlocal

rem Install binaries via Cabal in an isolated environment.



rem ###############################################################################
rem ##  Check for correct invocation  #############################################
rem ###############################################################################

set self=%~n0
if "%1"=="" (
      echo Usage: %self% ^(package^)+ >&2
      exit /b 1
)



rem ###############################################################################
rem ##  Create temporary directory  ###############################################
rem ###############################################################################

set mytmp=cabal-%random%
mkdir "%mytmp%"
echo Creating temporary directory (%mytmp%)
pushd "%mytmp%"



rem ###############################################################################
rem ##  Get prefix  ###############################################################
rem ###############################################################################

set prefix=%APPDATA%\cabal



rem ###############################################################################
rem ##  Run Cabal  ################################################################
rem ###############################################################################

(     cabal sandbox init ^
      && cabal install --disable-documentation ^
                       --disable-library-profiling ^
                       --disable-shared ^
                       --disable-executable-dynamic ^
                       --bindir="%prefix%\bin" ^
                       --datadir="%prefix%\share" ^
                       %*
) || (
      echo %self% %*: Installation failed! >&2
)



rem ###############################################################################
rem ##  Delete temporary directory  ###############################################
rem ###############################################################################

set /p deleteTemp="Remove temporary directory (%mytmp%) [Y/n]? "
if not "%deleteTemp%"=="n" (
      popd
      rmdir /s /q "%mytmp%"
)
