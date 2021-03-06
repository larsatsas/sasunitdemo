/**
   \file
   \ingroup    SASUNIT_UTIL_OS_LINUX

   \brief      set global macro variables for OS commands.

   \version    \$Revision: 636 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-03-22 15:27:14 +0100 (Fr, 22 Mär 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/linux/_oscmds.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

*/ /** \cond */  

%macro _oscmds;

   %global 
      g_removedir 
      g_makedir
      g_copydir
      g_endcommand
      g_sasstart
      g_splash
      g_infile_options
      ;
      
   %local
      l_macroName 
   ;   
   %LET l_macname=&sysmacroname;

   %LET g_removedir     =rm -r -f;
   %LET g_removefile    =rm;
   %LET g_makedir       =mkdir;
   %LET g_copydir       =cp -R;
   %LET g_endcommand    =%str(;);
   %LET g_sasstart      ="%sysfunc(pathname(sasroot))/bin/sas_&g_language.";
   %LET g_splash        =;   
   %LET g_infile_options=;
   
   %*************************************************************;
   %*** Check if XCMD is allowed                              ***;
   %*************************************************************;
   %IF %_handleError(&l_macname.
                 ,NOXCMD
                 ,(%sysfunc(getoption(XCMD)) = NOXCMD)
                 ,Your SAS Session does not allow XCMD%str(,) therefore functionality is restricted.
                 ,i_verbose=&g_verbose.
                 ,i_msgtype=WARNING
                 ) 
   %THEN %DO;
      * Should only be a warning, so reset error flag *;
      %let G_ERROR_CODE =;
   %END;
   %ELSE %DO;
      %_xcmd(umask 0033);
   %END;

%mend _oscmds;

/** \endcond */
