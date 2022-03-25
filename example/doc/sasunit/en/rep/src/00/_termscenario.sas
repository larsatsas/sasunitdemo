/**
   \file
   \ingroup    SASUNIT_UTIL

   \brief      close the scenario at the end of a test scenario.

   \version    \$Revision: 642 $
   \author     \$Author: klandwich $
   \date       \$Date: 2019-03-26 07:51:01 +0100 (Di, 26 Mär 2019) $
   
   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/_termscenario.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.
            
   \return
*/ /** \cond */ 


%MACRO _termScenario();
   %endScenario(i_messageStyle=NOTE);
%MEND _termScenario;
/** \endcond */
