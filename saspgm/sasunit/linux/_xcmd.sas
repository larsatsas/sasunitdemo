/**
   \file
   \ingroup    SASUNIT_UTIL_OS_LINUX

   \brief      run an operation system command

   \version    \$Revision: 635 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-02-28 16:50:25 +0100 (Do, 28 Feb 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/linux/_xcmd.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

   \param   i_cmd     OS command with quotes where necessary 
   \return  error symbol &sysrc will be set to a value other than 0, if an error occurs.

 */ /** \cond */ 

%MACRO _xcmd(i_cmd);
   %LOCAL logfile l_cmd rc filrf;

   %LET logfile=%sysfunc(pathname(work))/___log.txt;
   %let rc = %_delfile(&logfile);
   %sysexec &i_cmd > "&logfile";
   
   %IF &g_verbose. %THEN %DO;
      %PUT ======== OS Command Start ========;
       /* Evaluate sysexec?s return code*/
      %IF &sysrc. = 0 %then %put &g_note.(SASUNIT): Sysrc : 0 -> SYSEXEC SUCCESSFUL;
      %ELSE %PUT &g_error.(SASUNIT): Sysrc : &sysrc -> An Error occured;

      /* put sysexec command to log*/
      %PUT &g_note.(SASUNIT): SYSEXEC COMMAND IS: &i_cmd > "&logfile";
      
      /* write &logfile to the log */
      /* for the following commands "cd", "pwd", "setenv" or "umask" SAS executes
         SAS equivalent of these commands -> no files are generated that could be read */
      %LET filrf=_tmpf;
      %LET rc=%sysfunc(filename(filrf,&logfile));
      %LET rc = %sysfunc(fexist(&filrf));

      %IF (&rc) %THEN %DO;
         DATA _NULL_;
            infile "&logfile" truncover;
            input;
            putlog _infile_;
         RUN;
      %END;
      %ELSE %PUT No File Redirection for Commands cd, pwd, setenv and umask;
      %LET rc=%sysfunc(filename(filrf));
      
      %PUT ======== OS Command End ========;
   %END;
%MEND _xcmd; 

/** \endcond */

