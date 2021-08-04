* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 24 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--Teacher Math

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: Teacher Math
* Grade: Grade 8
* Subject: Math and Science

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\4_TIMSS_2019_G8_clean\TIMSS_2019_G8_clean.sav".

**************************
** Teacher variables **
**************************

* G1: Years of teaching experience.
RECODE
    BTBG01
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBG01
        (-99).
RENAME VARIABLES (
    BTBG01 = MYearTeach
    ).

* G2: Teacher gender.
RECODE
    BTBG02
        (1=0) (2=1)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG02
        0 'Female'
        1 'Male'.
MISSING VALUES
    BTBG02
        (-99).
RENAME VARIABLES (
    BTBG02 = MTchMale
    ).

* G3: Teacher age.
RECODE
    BTBG03
         (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) 
         (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG03 
       0 'Under 25'
       1 '25-29'
       2 '30-39'
       3 '40-49'
       4 '50-59'
       5 '60 or more' .
MISSING VALUES
    BTBG03
        (-99).
RENAME VARIABLES (
    BTBG03 = MAgeTeach
    ).

* G4: Teacher level of education.
RECODE
    BTBG04
        (1=0)  (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) 
        (99=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
   BTBG04 
       0 'Did not completed upper secondary'
       1 'Upper secondary'
       2 'Post-secondary or non-tertiary'
       3 'Short-cycle tertiary'
       4 'Bachelor'
       5 'Master'
       6 'Doctor'.
MISSING VALUES
    BTBG04
        (-99).
RENAME VARIABLES (
    BTBG04 = MEduLevel
    ).

* G5: Teacher major area of study.
RECODE
    BTBG05A BTBG05B BTBG05C BTBG05D BTBG05E
    BTBG05F BTBG05G BTBG05H BTBG05I
        (1=1) (2=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99). 
VALUE LABELS
    BTBG05A BTBG05B BTBG05C BTBG05D BTBG05E
    BTBG05F BTBG05G BTBG05H BTBG05I
        0 'No'
        1 'Yes'.
MISSING VALUES 
    BTBG05A BTBG05B BTBG05C BTBG05D BTBG05E
    BTBG05F BTBG05G BTBG05H BTBG05I
        (-99).
RENAME VARIABLES (
    BTBG05A BTBG05B BTBG05C BTBG05D BTBG05E
    BTBG05F BTBG05G BTBG05H BTBG05I
    =       
    MMajMath MMajBio MMajPhy MMajChe MMajEarth
    MMajEduM MMajEduS MMajEduG MMajOther
    ).

* G6: School emphasis on academic success (SEAS).
RECODE
    BTBG06A BTBG06B BTBG06C BTBG06D BTBG06E BTBG06F
    BTBG06G BTBG06H BTBG06I BTBG06J BTBG06K BTBG06L
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99). 
VALUE LABELS
    BTBG06A BTBG06B BTBG06C BTBG06D BTBG06E BTBG06F
    BTBG06G BTBG06H BTBG06I BTBG06J BTBG06K BTBG06L 
        0 'Very low'
        1 'Low'
        2 'Medium'
        3 'High'
        4 'Very high'.
MISSING VALUES
    BTBG06A BTBG06B BTBG06C BTBG06D BTBG06E BTBG06F
    BTBG06G BTBG06H BTBG06I BTBG06J BTBG06K BTBG06L
        (-99).
RENAME VARIABLES (
    BTBG06A BTBG06B BTBG06C BTBG06D BTBG06E BTBG06F
    BTBG06G BTBG06H BTBG06I BTBG06J BTBG06K BTBG06L
    =
    MSTchUnd MSTchSuc MSTchExp MSTchAbi MSParInv MSParCom
    MSparExp MSParSup MSStudDes MSRchGoal MSResPeer MScollab
    ).
    
* G7: Safety and orderly school.
RECODE
    BTBG07A BTBG07B BTBG07C BTBG07D
    BTBG07E BTBG07F BTBG07G BTBG07H
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG07A BTBG07B BTBG07C BTBG07D
    BTBG07E BTBG07F BTBG07G BTBG07H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BTBG07A BTBG07B BTBG07C BTBG07D
    BTBG07E BTBG07F BTBG07G BTBG07H
        (-99).
RENAME VARIABLES (
    BTBG07A BTBG07B BTBG07C BTBG07D
    BTBG07E BTBG07F BTBG07G BTBG07H
    =
    MOSafeNgh MOFeelSaf MOSecPol MOStdBhv
    MOStdRes MOResPro MOClrRul MORulEnf
    ).

* G8: Teacher job satisfaction.
RECODE
    BTBG08A BTBG08B BTBG08C BTBG08D BTBG08E
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG08A BTBG08B BTBG08C BTBG08D BTBG08E
        0 'Never or almost never'
        1 'Sometimes'
        2 'Often'
        3 'Very often'.
MISSING VALUES
    BTBG08A BTBG08B BTBG08C BTBG08D BTBG08E
        (-99).
RENAME VARIABLES (
    BTBG08A BTBG08B BTBG08C BTBG08D BTBG08E
    =
    MJContent MJPurpose MJEnthus MJInspire MJProud
    ).

* G9: Teaching limitation.
RECODE
    BTBG09A BTBG09B BTBG09C BTBG09D
    BTBG09E BTBG09F BTBG09G BTBG09H
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG09A BTBG09B BTBG09C BTBG09D
    BTBG09E BTBG09F BTBG09G BTBG09H
        0 'Agree a lot'
        1 'Agree a little'
        2 'Disagree a little'
        3 'Disagree a lot'.
MISSING VALUES
    BTBG09A BTBG09B BTBG09C BTBG09D
    BTBG09E BTBG09F BTBG09G BTBG09H
        (-99).
RENAME VARIABLES (
    BTBG09A BTBG09B BTBG09C BTBG09D
    BTBG09E BTBG09F BTBG09G BTBG09H
    =
    MLManyStd MLManyMat MLManyHr MLTimePrep
    MLTimeAss MLMchPres MLChgCur MLManyAdm
    ).

* G10A: Number of student in the class.
RECODE
    BTBG10
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBG10
        (-99).
RENAME VARIABLES (
    BTBG10 = MNStdCl
    ).

* G11: Number of students with language difficulties.
RECODE
    BTBG11
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBG11
        (-99).
RENAME VARIABLES (
    BTBG11 = MNStdLang
    ).

* G12: Teaching practices.
RECODE
    BTBG12A BTBG12B BTBG12C BTBG12D BTBG12E BTBG12F BTBG12G
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG12A BTBG12B BTBG12C BTBG12D BTBG12E BTBG12F BTBG12G
        0 'Never'
        1 'Some lessons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    BTBG12A BTBG12B BTBG12C BTBG12D BTBG12E BTBG12F BTBG12G
        (-99).
RENAME VARIABLES (
    BTBG12A BTBG12B BTBG12C BTBG12D BTBG12E BTBG12F BTBG12G
    =
    MPDalyLiv MPExpAns MPChlgEx MPClasDis MPLnkKnow MPPrbSolv MPExpsIde
    ).

* G13: Students limitation.
RECODE
    BTBG13A BTBG13B BTBG13C BTBG13D BTBG13E BTBG13F BTBG13G BTBG13H
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG13A BTBG13B BTBG13C BTBG13D BTBG13E BTBG13F BTBG13G BTBG13H
        0 'A lot'
        1 'Some'
        2 'Not at all'.
MISSING VALUES
    BTBG13A BTBG13B BTBG13C BTBG13D BTBG13E BTBG13F BTBG13G BTBG13H
        (-99).
RENAME VARIABLES (
    BTBG13A BTBG13B BTBG13C BTBG13D BTBG13E BTBG13F BTBG13G BTBG13H
    =
    MLLckKng MLLckNut MLLckSlep MLabsent MLDistStd MLUninStd MLMentImp MLDifUnLg
    ).

* M14: Time spent on math instruction.
RECODE
    BTBM14
        (9999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBM14
        (-99).
RENAME VARIABLES (
    BTBM14 = MMathTime
    ).

* M15: Math teaching practices.
RECODE
    BTBM15A BTBM15B BTBM15C BTBM15D
    BTBM15E BTBM15F BTBM15G BTBM15H 
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM15A BTBM15B BTBM15C BTBM15D
    BTBM15E BTBM15F BTBM15G BTBM15H
        0 'Never'
        1 'Some lessons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    BTBM15A BTBM15B BTBM15C BTBM15D
    BTBM15E BTBM15F BTBM15G BTBM15H
        (-99).
RENAME VARIABLES (
    BTBM15A BTBM15B BTBM15C BTBM15D
    BTBM15E BTBM15F BTBM15G BTBM15H
    =
    MMTExpln MMTSolve MMTMemrz MMTPract
    MMTApply MMTWork MMTMixAb MMTSameAb
    ).
    
* M16: Math teaching and access to calculator.
RECODE
    BTBM16
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM16
        0 'No, calculators are not permitted'
        1 'Yes, with restricted use'
        2 'Yes, with unrestricted use'.
MISSING VALUES
    BTBM16
        (-99).
RENAME VARIABLES (
    BTBM16 = MMUseCal
    ).

* M17: Mathteaching and access to computer.
RECODE
    BTBM17A BTBM17BA BTBM17BB BTBM17BC
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM17A BTBM17BA BTBM17BB BTBM17BC
        0 'No'
        1 'Yes'.
MISSING VALUES
    BTBM17A BTBM17BA BTBM17BB BTBM17BC
        (-99).
RENAME VARIABLES (
    BTBM17A BTBM17BA BTBM17BB BTBM17BC
    =
    MMPCAva MMPCStd MMPCClas MMPCSch
    ).


* M17C: Math teaching using computer.
RECODE
    BTBM17CA BTBM17CB BTBM17CC BTBM17CD
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM17CA BTBM17CB BTBM17CC BTBM17CD
        0 'Never or almost never'
        1 'Once or twice a month'
        2 'Once or twice a week'
        3 'Every or almost every day'.
MISSING VALUES
    BTBM17CA BTBM17CB BTBM17CC BTBM17CD
        (-99).
RENAME VARIABLES (
    BTBM17CA BTBM17CB BTBM17CC BTBM17CD
    =
    MMLpcClas MMLpcLow MMLpcHigh MMLpcNeed
    ).

* M18: Mathematics topics taught to use the TIMSS class.
RECODE
    BTBM18AA BTBM18AB BTBM18AC BTBM18BA BTBM18BB BTBM18BC
    BTBM18BD BTBM18BE BTBM18BF BTBM18BG BTBM18CA BTBM18CB
    BTBM18CC BTBM18CD BTBM18CE BTBM18CF BTBM18DA BTBM18DB
    BTBM18DC BTBM18DD BTBM18DE BTBM18DF
        (1=1) (2=2) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM18AA BTBM18AB BTBM18AC BTBM18BA BTBM18BB BTBM18BC
    BTBM18BD BTBM18BE BTBM18BF BTBM18BG BTBM18CA BTBM18CB
    BTBM18CC BTBM18CD BTBM18CE BTBM18CF BTBM18DA BTBM18DB
    BTBM18DC BTBM18DD BTBM18DE BTBM18DF
        0 'Not yet taught or just introduced'
        1 'Mostly taught before this year'
        2 'Mostly taught this year'.
MISSING VALUES
    BTBM18AA BTBM18AB BTBM18AC BTBM18BA BTBM18BB BTBM18BC
    BTBM18BD BTBM18BE BTBM18BF BTBM18BG BTBM18CA BTBM18CB
    BTBM18CC BTBM18CD BTBM18CE BTBM18CF BTBM18DA BTBM18DB
    BTBM18DC BTBM18DD BTBM18DE BTBM18DF
        (-99).
RENAME VARIABLES (
    BTBM18AA BTBM18AB BTBM18AC BTBM18BA BTBM18BB BTBM18BC
    BTBM18BD BTBM18BE BTBM18BF BTBM18BG BTBM18CA BTBM18CB
    BTBM18CC BTBM18CD BTBM18CE BTBM18CF BTBM18DA BTBM18DB
    BTBM18DC BTBM18DD BTBM18DE BTBM18DF
    =
    MMTopNum MMTopFrac MMTopPro MMTopSimp MMTopEqu MMTopInq
    MMTopSim MMTopFRep MMTopFPro MMTopNrc MMTopGeo MMTopPer
    MMTopPhy MMTopTrn MMTopFig MMTopDim MMTopData MMTopCol
    MMTopRep MMTopSts MMTopPrb MMTopCom
    ).

* M19: Time for math homework.
RECODE
    BTBM19A
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM19A
        0 'I do not assign mathematics homework'
        1 'Less than once a week'
        2 '1 or 2 times a week'
        3 '3 or 4 times a week'
        4 'Every day'.
MISSING VALUES
    BTBM19A
        (-99).
RENAME VARIABLES (
    BTBM19A = MMHomeW 
    ).

* M19B: Time for math homework.
RECODE
    BTBM19B
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM19B
        0 '15 minutes or less'
        1 '16--30 minutes'
        2 '31--60 minutes'
        3 'More than 60 minutes'.
MISSING VALUES
    BTBM19B
        (-99).
RENAME VARIABLES (
    BTBM19B = MMTimeHW
    ).

* M19C: Assessing mathematics homework.
RECODE
    BTBM19CA BTBM19CB BTBM19CC BTBM19CD BTBM19CE
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM19CA BTBM19CB BTBM19CC BTBM19CD BTBM19CE
        0 'Never or almost never'
        1 'Sometimes'
        2 'Always or almost always'.
MISSING VALUES
    BTBM19CA BTBM19CB BTBM19CC BTBM19CD BTBM19CE
        (-99).
RENAME VARIABLES (
    BTBM19CA BTBM19CB BTBM19CC BTBM19CD BTBM19CE
    =
    MMHWCor MMHWOwn MMHWDis MMHWMntr MMHWGrd
    ).

* M20: Math assessment strategies.
RECODE
    BTBM20A BTBM20B BTBM20C BTBM20D BTBM20E
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM20A BTBM20B BTBM20C BTBM20D BTBM20E
        0 'None'
        1 'Some'
        2 'A lot'.
MISSING VALUES
    BTBM20A BTBM20B BTBM20C BTBM20D BTBM20E
        (-99).
RENAME VARIABLES (
    BTBM20A BTBM20B BTBM20C BTBM20D BTBM20E
    =
    MMAsObs MMAsAsk MMAsShort MMAsLgTest MMAsLgPro
    ).

* M21: Math test on computer.
RECODE
    BTBM21
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM21
        0 'None'
        1 'Once a year'
        2 'Twice a year'
        3 'Once a month'
        4 'More than once a month'.
MISSING VALUES
    BTBM21
        (-99).
RENAME VARIABLES (
    BTBM21 = MMTestPC
    ).

* M22: PD to teach mathematics: Past experience (A) and future needs (B).
RECODE
    BTBM22AA BTBM22BA BTBM22AB BTBM22BB BTBM22AC BTBM22BC BTBM22AD
    BTBM22BD BTBM22AE BTBM22BE BTBM22AF BTBM22BF BTBM22AG BTBM22BG
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM22AA BTBM22BA BTBM22AB BTBM22BB BTBM22AC BTBM22BC BTBM22AD
    BTBM22BD BTBM22AE BTBM22BE BTBM22AF BTBM22BF BTBM22AG BTBM22BG
        0 'No'
        1 'Yes'.
MISSING VALUES
    BTBM22AA BTBM22BA BTBM22AB BTBM22BB BTBM22AC BTBM22BC BTBM22AD
    BTBM22BD BTBM22AE BTBM22BE BTBM22AF BTBM22BF BTBM22AG BTBM22BG
        (-99).
RENAME VARIABLES (
    BTBM22AA BTBM22BA BTBM22AB BTBM22BB BTBM22AC BTBM22BC BTBM22AD
    BTBM22BD BTBM22AE BTBM22BE BTBM22AF BTBM22BF BTBM22AG BTBM22BG
    =
    MMPDPCont MMPDFCont MMPDPPed MMPDFPed MMPDPCur MMPDFCur MMPDPTech
    MMPDFTech MMPDPProb MMPDFProb MMPDPAss MMPDFAss MMPDPNeed MMPDFNeed
    ).

* M23: Number of PD hours in mathematics.
RECODE
    BTBM23
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBM23
        0 'None'
        1 'Less than 6 hours'
        2 '6--15 hours'
        3 '16--35 hours'
        4 'More than 35 hours'.
MISSING VALUES
    BTBM23
        (-99).
RENAME VARIABLES (
    BTBM23 = MMPDHour
    ).


**************************
** Compound variables **
**************************

* Language of teacher questionnaire.
RECODE
    ITLANG_T
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ITLANG_T
        (-99).

* Locale ID of teacher questionnaire.
RECODE
    LCID_T
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    LCID_T
        (-99).

* TIMSS scale: SEAS.
RECODE
    BTBGEAS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGEAS
        (-99).
RENAME VARIABLES (
    BTBGEAS = MSCLSeas
    ).

* TIMSS scale: Teaching limited by students not ready.
RECODE
    BTBGLSN
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGLSN
        (-99).
RENAME VARIABLES (
    BTBGLSN = MSCLLimit
    ).

* TIMSS scale: Safe and orderly school.
RECODE
    BTBGSOS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGSOS
        (-99).
RENAME VARIABLES (
    BTBGSOS = MSCLSafe
    ).

* TIMSS scale: Teacher job satisfaction.
RECODE
    BTBGTJS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGTJS
        (-99).
RENAME VARIABLES (
    BTBGTJS = MSCLJob
    ).

* TIMSS scale: Teachers Emphasis on Science Investigation.
RECODE
    BTBSESI
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBSESI
        (-99).
RENAME VARIABLES (
    BTBSESI = MSCLExprm
    ).

* TIMSS index: SEAS.
RECODE
    BTDGEAS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDGEAS
        0 'Very High Emphasis'
        1 'Medium Emphasis'
        2  'Low Emphasis'.
MISSING VALUES
    BTDGEAS
        (-99).
RENAME VARIABLES (
    BTDGEAS = MIDXSeas
    ).

* TIMSS index: Teaching limited by students not ready.
RECODE
    BTDGLSN
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDGLSN
        0 'Not Limited'
        1 'Somewhat Limited'
        2 'Very Limited'.
MISSING VALUES
    BTDGLSN
        (-99).
RENAME VARIABLES (
    BTDGLSN = MIDXLimit
    ).

* TIMSS index: Safe and orderly school.
RECODE
    BTDGSOS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDGSOS
        0 'Less than safe and orderly'
        1 'Safe and orderly'
        2 'Very safe and orderly'.
MISSING VALUES
    BTDGSOS
        (-99).
RENAME VARIABLES (
    BTDGSOS = MIDXSafe
    ).

* TIMSS index: Teacher job satisfaction.
RECODE
    BTDGTJS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDGTJS
        0 'Less than satisfied'
        1 'Satisfied'
        2 'Very satisfied'.
MISSING VALUES
    BTDGTJS
        (-99).
RENAME VARIABLES (
    BTDGTJS = MIDXJob
    ).

* Percent of teachers majored in education and math.
RECODE
    BTDMMME
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDMMME
        0 'No Formal Education Beyond Upper Secondary'
        1 'All Other Majors'
        2 'Major in Science Education but not in Science'
        3 'Major in Science but not in Science Education'
        4 'Major in Science and Science Education'.
MISSING VALUES
    BTDMMME
        (-99).
RENAME VARIABLES (
    BTDMMME = MMTchMjr
    ).

* Percent of students taught math topics.
RECODE
    BTDMNUM
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDMNUM
        (-99).
RENAME VARIABLES (
    BTDMNUM = MPTpNumb
    ).

* Percent of students taught math topics.
RECODE
    BTDMALG
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDMALG
        (-99).
RENAME VARIABLES (
    BTDMALG = MPTpAlg
    ).

* Percent of students taught math topics.
RECODE
    BTDMGEO
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDMGEO
        (-99).
RENAME VARIABLES (
    BTDMGEO = MPTpGeo
    ).

* Percent of students taught math topics.
RECODE
    BTDMDAT
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDMDAT
        (-99).
RENAME VARIABLES (
    BTDMDAT = MPTpData
    ).

* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\4_TIMSS_2019_G8_clean\TIMSS_2019_G8_clean.sav".

***** End script *****

