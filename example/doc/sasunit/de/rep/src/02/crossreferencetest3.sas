/** 
   \file
   \ingroup    SASUNIT_EXAMPLES_TEST

   \brief      Testmacro for listcalling

               Please refer to <A href="https://sourceforge.net/p/sasunit/wiki/User's%20Guide/" target="_blank">SASUnit User's Guide</A>

   \version    \$Revision: 456 $
   \author     \$Author: klandwich $
   \date       \$Date: 2015-09-17 14:15:34 +0200 (Do, 17 Sep 2015) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/example/saspgm/crossreferencetest3.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

   \retval    o_result       Return code of the assert 0: OK / 1: ERROR
*/ /** \cond */ 

%macro CrossReferenceTest3 (i_nobs);

   %local l_var;

   proc freq data=test;
      table sex*age;
      title "A Standard Frequency Output";
   run;
   Title;
   
   data var;
      var = %CrossReferenceTest4(var1=5,var2=3);
   run;
   
%mend CrossReferenceTest3;
/** \endcond */
