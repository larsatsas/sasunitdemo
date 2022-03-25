/**
   \file
   \ingroup    SASUNIT_EXAMPLES_PGM

   \brief      Create combined dataset for a database

            
   \version    \$Revision: 451 $
   \author     \$Author: klandwich $
   \date       \$Date: 2015-09-07 08:49:43 +0200 (Mo, 07 Sep 2015) $

   \sa         For further information please refer to https://sourceforge.net/p/sasunit/wiki/User%27s%20Guide/
               Here you can find the SASUnit documentation, release notes and license information.
   \sa         \$HeadURL: https://svn.code.sf.net/p/sasunit/code/trunk/example/saspgm/combineddataset.sas $
   \copyright  This file is part of SASUnit, the Unit testing framework for SAS(R) programs.
               For copyright information and terms of usage under the GPL license see included file readme.txt
               or https://sourceforge.net/p/sasunit/wiki/readme/.

*/ /** \cond */ 

%MACRO combineddataset;

   proc sql noprint;
      create table work.combineddataset as
         select  CustomerName
                ,Customer.CustomerNumber
                ,Contracts.ContractNumber
                ,ContractType
         from work.Customer left join work.CustomerContracts 
         on Customer.CustomerNumber=CustomerContracts.CustomerNumber
         left join work.Contracts on CustomerContracts.ContractNumber=Contracts.ContractNumber;
   quit;

%MEND combineddataset;
/** \endcond */
