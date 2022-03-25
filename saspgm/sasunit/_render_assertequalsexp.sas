/**
   \file
   \ingroup    SASUNIT_REPORT

   \brief      renders the layout of the expected column for assertEquals

   \version    \$Revision: 451 $
   \author     \$Author: klandwich $
   \date       \$Date: 2015-09-07 08:49:43 +0200 (Mo, 07 Sep 2015) $
   
   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/saspgm/sasunit/_render_assertequalsexp.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.
			   
   \param   i_sourceColumn name of the column holding the value
   \param   o_html         Test report in HTML-format?
   \param   o_targetColumn name of the target column holding the ODS formatted value

*/ /** \cond */ 

%macro _render_assertEqualsExp (i_sourceColumn=
                               ,o_html=0
                               ,o_targetColumn=
                               );
   %_render_dataColumn(i_sourceColumn=&i_sourceColumn.
                      ,o_targetColumn=&o_targetColumn.
                      );
%mend _render_assertEqualsExp;
/** \endcond */
