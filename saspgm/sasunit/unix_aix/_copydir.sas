/**
   \file
   \ingroup    SASUNIT_UTIL_OS_UNIX_AIX

   \brief      copy a complete directory tree.
               Uses Windows XCOPY or Unix cp

   \version    \$Revision: 635 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-02-28 16:50:25 +0100 (Do, 28 Feb 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/unix_aix/_copydir.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

   \param   i_from       root of directory tree
   \param   i_to         copy to 
   \return  operation system return code or 0 if OK

*/ /** \cond */ 

%macro _copyDir(i_from
               ,i_to
               );

   %let l_i_from = %qsysfunc(tranwrd(&i_from, %str( ), %str(\ )));
   %let l_i_to   = %qsysfunc(tranwrd(&i_to, %str( ), %str(\ )));

   %SYSEXEC(cp -R &i_from. &i_to.);

   %put &g_note.(SASUNIT): sysrc=&sysrc;

%mend _copyDir;
/** \endcond */
