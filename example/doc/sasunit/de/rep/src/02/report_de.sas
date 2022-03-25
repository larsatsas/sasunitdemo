/**
   \file
   \ingroup    SASUNIT_EXAMPLES_TEST

   \brief      create german report in separate subfolder

   \version    \$Revision: 451 $
   \author     \$Author: klandwich $
   \date       \$Date: 2015-09-07 08:49:43 +0200 (Mo, 07 Sep 2015) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/example/saspgm/report_de.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

*/ /** \cond */ 


OPTIONS 
   MPRINT MAUTOSOURCE 
   SASAUTOS=(SASAUTOS "c:/projects/sasunit/saspgm/sasunit") /* SASUnit macro library */
;

/* open test repository */
%initSASUnit(
   i_root       = c:/projects/sasunit /* root path for convenience, following paths can be relative */
  ,io_target    = example/doc/sasunit /* input test repository */
)

/* create report - always force complete creation */
%reportSASUnit(i_language=DE, o_force=1, o_output=example\doc\sasunit.de)

/** \endcond */
