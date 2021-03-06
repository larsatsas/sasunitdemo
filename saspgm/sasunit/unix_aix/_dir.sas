/**
   \file
   \ingroup    SASUNIT_UTIL_OS_UNIX_AIX

   \brief      generates a dataset with the names of all files in a directory or directory tree.
               Wildcards may be used to specify the files to be included

               Resulting SAS dataset has the columns
               membername (name of the file in the directory)
               filename (name of file with absolute path, path separator is slash) 
               changed (last modification data as SAS datetime).

   \version    \$Revision: 635 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-02-28 16:50:25 +0100 (Do, 28 Feb 2019) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/unix_aix/_dir.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

   \param   i_path       name of directory or file group (containing wildcards) with full path
   \param   i_recursive  1 .. search recursively in subdirectories, default is 0
   \param   o_out        output dataset, default is work.dir. This dataset contains two columns
                         named filename and changed

*/ /** \cond */

%MACRO _dir(i_path=
           ,i_recursive=0
           ,o_out=work.dir
           );

   %LOCAL dirfile encoding s l_i_path;

   proc sql noprint;
      create table &o_out (filename char(255));
   quit;

   %IF (not %sysfunc (exist (&o_out))) %THEN %GOTO errexit;

   %let encoding=pcoem850;
   %let s =;
   %let dirfile=%sysfunc(pathname(work))/&o_out..dir.txt;
   filename _dirfile "&dirfile" encoding=&encoding;

   %put &g_note.(SASUNIT): Directory search is: &i_path;

   %let l_i_path=%qsysfunc(tranwrd(&i_path, %str( ), %str(\ )));

   %let search = %qscan(&l_i_path.,-1,'/');
   %let k = %index(&l_i_path.,%qtrim(&search.));
   %let path = %qsubstr(&l_i_path.,1,%eval(&k.-2));
   %if %qsubstr(&path.,1,1) eq %str(%') %then
       %let path = &path.%str(%');
   %if %qsubstr(&path.,1,1) eq %str(%") %then
       %let path = &path.%str(%");

   %put &g_note.(SASUNIT): Adjusted directory is: &path;
   %put &g_note.(SASUNIT): Dearch pattern is    : &search;

   %SYSEXEC(find -L &path. ! -name &path -name "&search." -ls -type f > &dirfile.);

   %if &g_verbose. %then %do;
      %put ======== OS Command Start ========;
      /* Evaluate sysexec?s return code */
      %if &sysrc. = 0 %then %put &g_note.(SASUNIT): Sysrc : 0 -> SYSEXEC SUCCESSFUL;
      %else %put &g_error.(SASUNIT): Sysrc : &sysrc -> An Error occured;

      /* put sysexec command to log*/
      %put &g_note.(SASUNIT): SYSEXEC COMMAND IS: find -L &path. ! -name &path -name "&search." -ls -type f > &dirfile.;
      
      /* write &dirfile to the log*/
      data _null_;
         infile "&dirfile" truncover lrecl=512;
         input line $512.;
         putlog line;
      run;
      %put ======== OS Command End ========;
   %end;
   
   data &o_out (keep=membername filename changed);
      array dum{7} $;
      array dat{3} $;
      length filename membername $255
             temp_path temp_file $255
             fileall  $1024
             ;
      format changed datetime20.;
      infile _dirfile delimiter=' ' truncover;
      input dum1-dum7 $ dat1-dat3 $ fileall $;
      filename = fileall;
      if substr(dum3,1,1)='d' then delete;
      if index(dat3,':') gt 0 then do;
         changed = input(compress(dat2 || dat1 || year(today())) || " " || dat3, datetime.);
         if datepart(changed) gt today() then do;
            changed = input(compress(dat2 || dat1 || year(today())-1) || " " || dat3, datetime.);
         end;
      end;
      else do;
         changed =input(compress( dat2 || dat1 || dat3) || " 00:00", datetime.);
      end;
      loca = length(filename) - length(scan(filename,-1,'/')) + 1;
      membername = substr(filename,loca);

      %if &i_recursive=0 %then %do;
         temp_path = dequote("&path");
         temp_file = scan(filename,-1,"/");
         if (trim(temp_path) !! "/" !! trim(temp_file) = filename) then output;
      %end;
   run;

%errexit:
%MEND _dir;
/** \endcond */

