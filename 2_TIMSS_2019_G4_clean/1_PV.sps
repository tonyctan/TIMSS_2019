﻿* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 15 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--PV

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: (Plausible values)
* Grade: Grade 4
* Subject: Math and Science

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\1_TIMSS_2019_G4_merge\TIMSS_2019_G4_import.sav".

**************************
** Admin variables **
**************************
*1: Country ID - Numeric ISO Code.
RECODE
    IDCNTRY
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDCNTRY
        (-99).

*2: Student Test Booklet.
RECODE
    IDBOOK
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDBOOK
        (-99).

*3: School ID.
RECODE
    IDSCHOOL
        (9999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDSCHOOL
        (-99).

*4: Class ID.
RECODE
    IDCLASS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDCLASS
        (-99).

*5: Student ID.
RECODE
    IDSTUD
        (99999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDSTUD
        (-99).

*6: Teacher ID and Link.
RECODE
    IDTEALIN
        (99999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDTEALIN
        (-99).

*7: Teacher ID.
RECODE
    IDTEACH
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDTEACH
        (-99).

*8: Teacher Link Number.
RECODE
    IDLINK
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDLINK
        (-99).

*9: Population ID.
RECODE
    IDPOP
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDPOP
        (-99).

*10: Standardized Grade ID.
RECODE
    IDGRADER
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDGRADER
        (-99).

*11: Grade ID.
RECODE
    IDGRADE
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDGRADE
        (-99).

*12: Subject ID.
RECODE
    IDSUBJ
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    IDSUBJ
        (-99).

*13: Subject Code in instrument.
RECODE
    ITCOURSE
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ITCOURSE
        (-99).

*14: Mathematics Teacher Link.
RECODE
    MATSUBJ
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    MATSUBJ
        (-99).

*15: Science Teacher Link.
RECODE
    SCISUBJ
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    SCISUBJ
        (-99).

*16: Number of Math Teachers for Student.
RECODE
    NMTEACH
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    NMTEACH
        (-99).

*17: Number of Science Teachers for Student.
RECODE
    NSTEACH
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    NSTEACH
        (-99).

*18: Number of Teachers.
RECODE
    NTEACH
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    NTEACH
        (-99).

*19: WEIGHT FOR MATHEMATICS TEACHER DATA.
RECODE
    MATWGT
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    MATWGT
        (-99).

*20: JACKKNIFE REPLICATE CODE.
RECODE
    JKREP
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    JKREP
        (-99).

*21: JACKKNIFE ZONE.
RECODE
    JKZONE
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    JKZONE
        (-99).


**************************
** Plausible values **
**************************

RECODE
    ASMMAT01 ASMMAT02 ASMMAT03 ASMMAT04 ASMMAT05
    ASSSCI01 ASSSCI02 ASSSCI03 ASSSCI04 ASSSCI05
    ASMNUM01 ASMNUM02 ASMNUM03 ASMNUM04 ASMNUM05
    ASMGEO01 ASMGEO02 ASMGEO03 ASMGEO04 ASMGEO05
    ASMDAT01 ASMDAT02 ASMDAT03 ASMDAT04 ASMDAT05
    ASMKNO01 ASMKNO02 ASMKNO03 ASMKNO04 ASMKNO05
    ASMAPP01 ASMAPP02 ASMAPP03 ASMAPP04 ASMAPP05
    ASMREA01 ASMREA02 ASMREA03 ASMREA04 ASMREA05
    ASSLIF01 ASSLIF02 ASSLIF03 ASSLIF04 ASSLIF05
    ASSPHY01 ASSPHY02 ASSPHY03 ASSPHY04 ASSPHY05
    ASSEAR01 ASSEAR02 ASSEAR03 ASSEAR04 ASSEAR05
    ASSKNO01 ASSKNO02 ASSKNO03 ASSKNO04 ASSKNO05
    ASSAPP01 ASSAPP02 ASSAPP03 ASSAPP04 ASSAPP05
    ASSREA01 ASSREA02 ASSREA03 ASSREA04 ASSREA05
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASMMAT01 ASMMAT02 ASMMAT03 ASMMAT04 ASMMAT05
    ASSSCI01 ASSSCI02 ASSSCI03 ASSSCI04 ASSSCI05
    ASMNUM01 ASMNUM02 ASMNUM03 ASMNUM04 ASMNUM05
    ASMGEO01 ASMGEO02 ASMGEO03 ASMGEO04 ASMGEO05
    ASMDAT01 ASMDAT02 ASMDAT03 ASMDAT04 ASMDAT05
    ASMKNO01 ASMKNO02 ASMKNO03 ASMKNO04 ASMKNO05
    ASMAPP01 ASMAPP02 ASMAPP03 ASMAPP04 ASMAPP05
    ASMREA01 ASMREA02 ASMREA03 ASMREA04 ASMREA05
    ASSLIF01 ASSLIF02 ASSLIF03 ASSLIF04 ASSLIF05
    ASSPHY01 ASSPHY02 ASSPHY03 ASSPHY04 ASSPHY05
    ASSEAR01 ASSEAR02 ASSEAR03 ASSEAR04 ASSEAR05
    ASSKNO01 ASSKNO02 ASSKNO03 ASSKNO04 ASSKNO05
    ASSAPP01 ASSAPP02 ASSAPP03 ASSAPP04 ASSAPP05
    ASSREA01 ASSREA02 ASSREA03 ASSREA04 ASSREA05
        (-99).
RENAME VARIABLES (
    ASMMAT01 ASMMAT02 ASMMAT03 ASMMAT04 ASMMAT05
    ASSSCI01 ASSSCI02 ASSSCI03 ASSSCI04 ASSSCI05
    ASMNUM01 ASMNUM02 ASMNUM03 ASMNUM04 ASMNUM05
    ASMGEO01 ASMGEO02 ASMGEO03 ASMGEO04 ASMGEO05
    ASMDAT01 ASMDAT02 ASMDAT03 ASMDAT04 ASMDAT05
    ASMKNO01 ASMKNO02 ASMKNO03 ASMKNO04 ASMKNO05
    ASMAPP01 ASMAPP02 ASMAPP03 ASMAPP04 ASMAPP05
    ASMREA01 ASMREA02 ASMREA03 ASMREA04 ASMREA05
    ASSLIF01 ASSLIF02 ASSLIF03 ASSLIF04 ASSLIF05
    ASSPHY01 ASSPHY02 ASSPHY03 ASSPHY04 ASSPHY05
    ASSEAR01 ASSEAR02 ASSEAR03 ASSEAR04 ASSEAR05
    ASSKNO01 ASSKNO02 ASSKNO03 ASSKNO04 ASSKNO05
    ASSAPP01 ASSAPP02 ASSAPP03 ASSAPP04 ASSAPP05
    ASSREA01 ASSREA02 ASSREA03 ASSREA04 ASSREA05
    =
    PVMATH1 PVMATH2 PVMATH3 PVMATH4 PVMATH5
    PVSCI1 PVSCI2 PVSCI3 PVSCI4 PVSCI5
    PVNUM1 PVNUM2 PVNUM3 PVNUM4 PVNUM5
    PVGEO1 PVGEO2 PVGEO3 PVGEO4 PVGEO5
    PVDATA1 PVDATA2 PVDATA3 PVDATA4 PVDATA5
    PVMKNOW1 PVMKNOW2 PVMKNOW3 PVMKNOW4 PVMKNOW5
    PVMAPLY1 PVMAPLY2 PVMAPLY3 PVMAPLY4 PVMAPLY5
    PVMREA1 PVMREA2 PVMREA3 PVMREA4 PVMREA5
    PVLIFE1 PVLIFE2 PVLIFE3 PVLIFE4 PVLIFE5
    PVPHY1 PVPHY2 PVPHY3 PVPHY4 PVPHY5
    PVEARTH1 PVEARTH2 PVEARTH3 PVEARTH4 PVEARTH5
    PVSKNOW1 PVSKNOW2 PVSKNOW3 PVSKNOW4 PVSKNOW5
    PVSAPLY1 PVSAPLY2 PVSAPLY3 PVSAPLY4 PVSAPLY5
    PVSREA1 PVSREA2 PVSREA3 PVSREA4 PVSREA5
    ).

RECODE
    ASMIBM01 ASMIBM02 ASMIBM03 ASMIBM04 ASMIBM05
    ASSIBM01 ASSIBM02 ASSIBM03 ASSIBM04 ASSIBM05 
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASMIBM01 ASMIBM02 ASMIBM03 ASMIBM04 ASMIBM05
    ASSIBM01 ASSIBM02 ASSIBM03 ASSIBM04 ASSIBM05
        (-99).
RENAME VARIABLES (
    ASMIBM01 ASMIBM02 ASMIBM03 ASMIBM04 ASMIBM05
    ASSIBM01 ASSIBM02 ASSIBM03 ASSIBM04 ASSIBM05
    =
    MBENCH1 MBENCH2 MBENCH3 MBENCH4 MBENCH5
    SBENCH1 SBENCH2 SBENCH3 SBENCH4 SBENCH5
    ).

**************************
** Version control **
**************************


* Remove phamton variable(s).
DELETE VARIABLES
    idbid VERSION SCOPE
    .

* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\2_TIMSS_2019_G4_clean\TIMSS_2019_G4_clean.sav".

***** End script *****
