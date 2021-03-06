/**
   \file
   \ingroup    SASUNIT_UTIL_OS_UNIX_AIX

   \brief      set global macro variables for OS commands.

   \version    \$Revision: 635 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-02-28 16:50:25 +0100 (Do, 28 Feb 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/unix_aix/_oscmds.sas $
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

   %LET g_removedir     =rm -r -f;
   %LET g_removefile    =rm;
   %LET g_makedir       =mkdir;
   %LET g_copydir       =cp -R;
   %LET g_endcommand    =%str(;);
   %_xcmd(umask 003);
   %let g_sasstart      ="%sysfunc(pathname(sasroot))/sasexe/sas";
   %let g_splash        =;
   %LET g_infile_options=;

%mend _oscmds;

/** \endcond */
