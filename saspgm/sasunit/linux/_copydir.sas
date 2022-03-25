/**
   \file
   \ingroup    SASUNIT_UTIL_OS_LINUX

   \brief      copy a complete directory tree.
               Uses Windows XCOPY or Unix cp

   \version    \$Revision: 635 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-02-28 16:50:25 +0100 (Do, 28 Feb 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/linux/_copydir.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

   \param   i_from       root of directory tree
   \param   i_to         copy to 
   \return  operation system return code or 0 if OK

*/ /** \cond */ 

%macro _copyDir (i_from
                ,i_to
                );

   %LOCAL l_i_from l_i_to logfile;

   %let l_i_from = %qsysfunc(tranwrd(&i_from, %str( ), %str(\ )));
   %let l_i_to   = %qsysfunc(tranwrd(&i_to, %str( ), %str(\ )));
   %let logfile  = %sysfunc(pathname(work))/___log.txt;

   %SYSEXEC(cp -R &l_i_from. &l_i_to. > "&logfile" 2>&1);
   %if &g_verbose. %then %do;
      %put ======== OS Command Start ========;
       /* Evaluate sysexec�s return code*/
      %if &sysrc. = 0 %then %put &g_note.(SASUNIT): Sysrc : 0 -> SYSEXEC SUCCESSFUL;
      %else %put &g_error.(SASUNIT): Sysrc : &sysrc -> An Error occured;

      /* put sysexec command to log*/
      %put &g_note.(SASUNIT): SYSEXEC COMMAND IS: cp -R &l_i_from. &l_i_to. > "&logfile" 2>&1;
      
      /* write &logfile to the log*/
      data _null_;
         infile "&logfile" truncover lrecl=512;
         input line $512.;
         putlog line;
      run;
      %put ======== OS Command End ========;
   %end;
%mend _copyDir;
/** \endcond */
