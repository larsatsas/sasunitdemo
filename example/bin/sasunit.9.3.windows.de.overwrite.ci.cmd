@echo off
REM This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
REM For copyright information and terms of usage under the GPL license see included file readme.txt
REM or https://sourceforge.net/p/sasunit/wiki/readme/.

cd ..
SET SASUNIT_ROOT=..\.
SET SASUNIT_OVERWRITE=1
SET SASUNIT_LANGUAGE=de
SET SASUNIT_HOST_OS=windows
SET SASUNIT_SAS_VERSION=9.3
SET SASUNIT_COVERAGEASSESSMENT=1
SET SASUNIT_PGMDOC=1
SET SASUNIT_PGMDOC_SASUNIT=1
SET SASUNIT_CROSSREFERENCE=1
SET SASUNIT_CROSSREFERENCE_SASUNIT=1
SET SASUNIT_VERBOSE=0

REM Check if SASUnit Jenkins Plugin is present and use given SASUnit root path
echo Checking for presence of SASUnit Jenkins plugin...
if not [%1] == [] SET SASUNIT_ROOT=%~1
if [%1] == [] (
   echo ... parameter not found. Using SASUnit root path from script
   echo.
) else (
   echo ...plugin found. Using plugin provided SASUnit root path
   echo.
)
echo SASUnit root path     = %SASUNIT_ROOT%
echo SASUnit config        = bin\sasunit.%SASUNIT_SAS_VERSION%.%SASUNIT_HOST_OS%.%SASUNIT_LANGUAGE%.cfg
echo Overwrite             = %SASUNIT_OVERWRITE%
echo Testcoverage          = %SASUNIT_COVERAGEASSESSMENT%
echo Program Documentation = %SASUNIT_PGMDOC%
echo PgmDoc for SASUnit    = %SASUNIT_PGMDOC_SASUNIT%
echo Crossreference        = %SASUNIT_CROSSREFERENCE%
echo Crossref for SASUnit  = %SASUNIT_CROSSREFERENCE_SASUNIT%
echo Verbose               = %SASUNIT_VERBOSE%
echo.

REM Deletion of SASUnit styles to avoid incompatibilites between 32 and 64 bit systems
echo Deleting SASUnit styles
del "%SASUNIT_ROOT%\resources\style\*.sas7bitm"

echo "Starting SASUnit in Overwrite Mode ..."
"C:\Program Files\SASHome\SASFoundation\9.3\sas.exe" -CONFIG "bin\sasunit.%SASUNIT_SAS_VERSION%.%SASUNIT_HOST_OS%.%SASUNIT_LANGUAGE%.cfg" -no$syntaxcheck -noovp -nosplash

@echo off
if %ERRORLEVEL%==0 goto normalexit
@echo. 
@echo Exit code: %ERRORLEVEL%
@echo. 
if %ERRORLEVEL%==1 @echo SAS ended with warnings. Review run_all.log for details.
if %ERRORLEVEL%==2 @echo SAS ended with errors! Check run_all.log for details!
@echo. 
:normalexit