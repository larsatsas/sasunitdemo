/**
   \file
   \ingroup    SASUNIT_UTIL_OS_UNIX_AIX

   \brief      execute an command file by operation system command

   \version    \$Revision: 635 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-02-28 16:50:25 +0100 (Do, 28 Feb 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/unix_aix/_executecmdfile.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

   \param   i_cmdFile    Command file to be executed by the OS

*/ 
/** \cond */ 

%macro _executeCMDFile(i_cmdFile
                      );
                 
   %_xcmd(chmod u+x "&i_cmdFile.")
   %_xcmd(sed -e 's/\r//g' "&i_cmdFile." > ~/temp.; mv ~/temp. "&i_cmdFile.");
   %_xcmd("&i_cmdFile.")

%mend _executeCMDFile;   

/** \endcond */
