* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 24 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--Teacher Science

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: Teacher Science
* Grade: Grade 8
* Subject: Science

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\5_TIMSS_2019_G8_S_clean\TIMSS_2019_G8_S_clean.sav".

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
    BTBG01 = YearTeach
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
    BTBG02 = TchMale
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
    BTBG03 = AgeTeach
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
    BTBG04 = EduLevel
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
    MajMath MajBio MajPhy MajChe MajEarth
    MajEduM MajEduS MajEduG MajOther
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
        0 'No'
        1 'Yes'.
MISSING VALUES
    BTBG06A BTBG06B BTBG06C BTBG06D BTBG06E BTBG06F
    BTBG06G BTBG06H BTBG06I BTBG06J BTBG06K BTBG06L
        (-99).
RENAME VARIABLES (
    BTBG06A BTBG06B BTBG06C BTBG06D BTBG06E BTBG06F
    BTBG06G BTBG06H BTBG06I BTBG06J BTBG06K BTBG06L
    =
    SSTchUnd SSTchSuc SSSTchExp SSTchAbi SSParInv SSParCom
    SSparExp SSParSup SSStudDes SSRchGoal SSResPeer SScollab
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
    OSafeNgh OFeelSaf OSecPol OStdBhv
    OStdRes OResPro OClrRul ORulEnf
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
    JContent JPurpose JEnthus JInspire JProud
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
    LManyStd LManyMat LManyHr LTimePrep
    LTimeAss LMchPres LChgCur LManyAdm
    ).

* G10A: Number of student in the class.
RECODE
    BTBG10
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBG10
        (-99).
RENAME VARIABLES (
    BTBG10 = NStdCl
    ).

* G11: Number of students with language difficulties.
RECODE
    BTBG11
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBG11
        (-99).
RENAME VARIABLES (
    BTBG11 = NStdLang
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
    PDalyLiv PExpAns PChlgEx PClasDis
    PLnkKnow PPrbSolv PExpsIde
    ).

* G13: Students limitation.
RECODE
    BTBG13A BTBG13B BTBG13C BTBG13D
    BTBG13E BTBG13F BTBG13G BTBG13H
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBG13A BTBG13B BTBG13C BTBG13D
    BTBG13E BTBG13F BTBG13G BTBG13H
        0 'A lot'
        1 'Some'
        2 'Not at all'.
MISSING VALUES
    BTBG13A BTBG13B BTBG13C BTBG13D
    BTBG13E BTBG13F BTBG13G BTBG13H
        (-99).
RENAME VARIABLES (
    BTBG13A BTBG13B BTBG13C BTBG13D
    BTBG13E BTBG13F BTBG13G BTBG13H
    =
    LLckKng LLckNut LLckSlep Labsent
    LDistStd LUninStd LMentImp LDifUnLg
    ).

* S14: Time spent on science instruction.
RECODE
    BTBS14
        (9999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBS14
        (-99).
RENAME VARIABLES (
    BTBS14 = SciTime
    ).

* S15: science teaching practices.
RECODE
    BTBS15A BTBS15B BTBS15C BTBS15D BTBS15E BTBS15F BTBS15G
    BTBS15H BTBS15I BTBS15J BTBS15K BTBS15L BTBS15M BTBS15N
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS15A BTBS15B BTBS15C BTBS15D BTBS15E BTBS15F BTBS15G
    BTBS15H BTBS15I BTBS15J BTBS15K BTBS15L BTBS15M BTBS15N
        0 'Never'
        1 'Some lessons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    BTBS15A BTBS15B BTBS15C BTBS15D BTBS15E BTBS15F BTBS15G
    BTBS15H BTBS15I BTBS15J BTBS15K BTBS15L BTBS15M BTBS15N
        (-99).
RENAME VARIABLES (
    BTBS15A BTBS15B BTBS15C BTBS15D BTBS15E BTBS15F BTBS15G
    BTBS15H BTBS15I BTBS15J BTBS15K BTBS15L BTBS15M BTBS15N
    =
    STExpln STObsrv STDemo STPlnEx STConEx STPreDat STIntDat STUseEvi
    STReadBk STMrzFc STUseFor STFieldW STMixAb STSameAb
    ).

* S16A: Science teaching and access to computer.
RECODE
    BTBS16A BTBS16BA BTBS16BB BTBS16BC
        (1=1) (2=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS16A BTBS16BA BTBS16BB BTBS16BC
        0 'No'
        1 'Yes'.
MISSING VALUES
    BTBS16A BTBS16BA BTBS16BB BTBS16BC
        (-99).
RENAME VARIABLES (
    BTBS16A BTBS16BA BTBS16BB BTBS16BC
    =
    SPCAva SPCStd SPCClas SPCSch
    ).

* S16B: Science teaching using computer.
RECODE
    BTBS16CA BTBS16CB BTBS16CC BTBS16CD
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS16CA BTBS16CB BTBS16CC BTBS16CD
        0 'Never or almost never'
        1 'Once or twice a month'
        2 'Once or twice a week'
        3 'Every or almost every day'.
MISSING VALUES
    BTBS16CA BTBS16CB BTBS16CC BTBS16CD
        (-99).
RENAME VARIABLES (
    BTBS16CA BTBS16CB BTBS16CC BTBS16CD
    =
    SLpcClas SLpcLow SLpcHigh SLpcNeed
    ).

* S17: Science Topics Taught to the TIMSS Class.
RECODE
    BTBS17AA BTBS17AB BTBS17AC BTBS17AD BTBS17AE BTBS17AF BTBS17AG
    BTBS17BA BTBS17BB BTBS17BC BTBS17BD BTBS17BE BTBS17BF BTBS17BG BTBS17BH
    BTBS17CA BTBS17CB BTBS17CC BTBS17CD BTBS17CE BTBS17CF BTBS17CG
    BTBS17DA BTBS17DB BTBS17DC BTBS17DD
        (1=1) (2=2) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS17AA BTBS17AB BTBS17AC BTBS17AD BTBS17AE BTBS17AF BTBS17AG
    BTBS17BA BTBS17BB BTBS17BC BTBS17BD BTBS17BE BTBS17BF BTBS17BG BTBS17BH
    BTBS17CA BTBS17CB BTBS17CC BTBS17CD BTBS17CE BTBS17CF BTBS17CG
    BTBS17DA BTBS17DB BTBS17DC BTBS17DD
        0 'Not yet taught or just introduced'
        1 'Mostly taught before this year'
        2 'Mostly taught this year'.
MISSING VALUES
    BTBS17AA BTBS17AB BTBS17AC BTBS17AD BTBS17AE BTBS17AF BTBS17AG
    BTBS17BA BTBS17BB BTBS17BC BTBS17BD BTBS17BE BTBS17BF BTBS17BG BTBS17BH
    BTBS17CA BTBS17CB BTBS17CC BTBS17CD BTBS17CE BTBS17CF BTBS17CG
    BTBS17DA BTBS17DB BTBS17DC BTBS17DD
        (-99).
RENAME VARIABLES (
    BTBS17AA BTBS17AB BTBS17AC BTBS17AD BTBS17AE BTBS17AF BTBS17AG
    BTBS17BA BTBS17BB BTBS17BC BTBS17BD BTBS17BE BTBS17BF BTBS17BG BTBS17BH
    BTBS17CA BTBS17CB BTBS17CC BTBS17CD BTBS17CE BTBS17CF BTBS17CG
    BTBS17DA BTBS17DB BTBS17DC BTBS17DD
    =
    TBTaxon TBOrgan TBCell TBRepro TBVary TBPopul TBHealth
    TCStrct TCTable TCMater TCMixtr TCAcid TCReactn TCEnrgy TCElctrn
    TPState TPTransf TPLight TPSound TPCirct TPMgnt TPForce
    TEStrctr TEProcs TERescr TESolar
    ).

* S18A: Time for math homework.
RECODE
    BTBS18A
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS18A
        0 'I do not assign mathematics homework'
        1 'Less than once a week'
        2 '1 or 2 times a week'
        3 '3 or 4 times a week'
        4 'Every day'.
MISSING VALUES
    BTBS18A
        (-99).
RENAME VARIABLES (
    BTBS18A = SHomeW
    ).

* S18B: Time for math homework.
RECODE
    BTBS18B
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS18B
        0 '15 minutes or less'
        1 '16-30 minutes'
        2 '31-60 minutes'
        3 '61-90 minutes'
        4 'More than 90 minutes'.
MISSING VALUES
    BTBS18B
        (-99).
RENAME VARIABLES (
    BTBS18B = STimeHW
    ).

* S18C: Assessing science homework.
RECODE
    BTBS18CA BTBS18CB BTBS18CC BTBS18CD BTBS18CE
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS18CA BTBS18CB BTBS18CC BTBS18CD BTBS18CE
        0 'Never or almost never'
        1 'Sometimes'
        2 'Always or almost always'.
MISSING VALUES
    BTBS18CA BTBS18CB BTBS18CC BTBS18CD BTBS18CE
        (-99).
RENAME VARIABLES (
    BTBS18CA BTBS18CB BTBS18CC BTBS18CD BTBS18CE
    =
    SHWCor SHWOwn SHWDis SHWMntr SHWGrd
    ).

* S19: science assessment strategies.
RECODE
    BTBS19A BTBS19B BTBS19C BTBS19D BTBS19E
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS19A BTBS19B BTBS19C BTBS19D BTBS19E
        0 'None'
        1 'Some'
        2 'A lot'.
MISSING VALUES
    BTBS19A BTBS19B BTBS19C BTBS19D BTBS19E
        (-99).
RENAME VARIABLES (
    BTBS19A BTBS19B BTBS19C BTBS19D BTBS19E
    =
    SAsObs SAsAsk SAsShort SAsLgTest SAsLgPro
    ).

* S20: science test on computer.
RECODE
    BTBS20
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS20
        0 'Never'
        1 'Once a year'
        2 'Twice a year'
        3 'Once a month'
        4 'More than once a month'.
MISSING VALUES
    BTBS20
        (-99).
RENAME VARIABLES (
    BTBS20 = STestPC
    ).

* S21: PD to teach science: Past experience (A) and future needs (B).
RECODE
    BTBS21AA BTBS21BA BTBS21AB BTBS21BB BTBS21AC BTBS21BC BTBS21AD
    BTBS21BD BTBS21AE BTBS21BE BTBS21AF BTBS21BF BTBS21AG BTBS21BG
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS21AA BTBS21BA BTBS21AB BTBS21BB BTBS21AC BTBS21BC BTBS21AD
    BTBS21BD BTBS21AE BTBS21BE BTBS21AF BTBS21BF BTBS21AG BTBS21BG
        0 'No'
        1 'Yes'.
MISSING VALUES
    BTBS21AA BTBS21BA BTBS21AB BTBS21BB BTBS21AC BTBS21BC BTBS21AD
    BTBS21BD BTBS21AE BTBS21BE BTBS21AF BTBS21BF BTBS21AG BTBS21BG
        (-99).
RENAME VARIABLES (
    BTBS21AA BTBS21BA BTBS21AB BTBS21BB BTBS21AC BTBS21BC BTBS21AD
    BTBS21BD BTBS21AE BTBS21BE BTBS21AF BTBS21BF BTBS21AG BTBS21BG
    =
    SPDPCont SPDFCont SPDPPed SPDFPed SPDPCur SPDFCur SPDPTech
    SPDFTech SPDPCrit SPDFCrit SPDPAss SPDFAss SPDPNeed SPDFNeed
    ).

* S22: Number of PD hours in science.
RECODE
    BTBS22
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTBS22
        0 'None'
        1 'Less than 6 hours'
        2 '6--15 hours'
        3 '16--35 hours'
        4 'More than 35 hours'.
MISSING VALUES
    BTBS22
        (-99).
RENAME VARIABLES (
    BTBS22 = SPDHour
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
    BTBGEAS = SSCLSeas
    ).

* TIMSS scale: Teaching limited by students not ready.
RECODE
    BTBGLSN
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGLSN
        (-99).
RENAME VARIABLES (
    BTBGLSN = SCLLimit
    ).

* TIMSS scale: Safe and orderly school.
RECODE
    BTBGSOS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGSOS
        (-99).
RENAME VARIABLES (
    BTBGSOS = SCLSafe
    ).

* TIMSS scale: Teacher job satisfaction.
RECODE
    BTBGTJS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBGTJS
        (-99).
RENAME VARIABLES (
    BTBGTJS = SCLJob
    ).

* TIMSS scale: Teachers Emphasis on Science Investigation.
RECODE
    BTBSESI
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTBSESI
        (-99).
RENAME VARIABLES (
    BTBSESI = SCLExprm
    ).

* TIMSS index: Safe and orderly school.
RECODE
    BTDGEAS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDGEAS
        0 'Less than safe and orderly'
        1 'Safe and orderly'
        2 'Very safe and orderly'.
MISSING VALUES
    BTDGEAS
        (-99).
RENAME VARIABLES (
    BTDGEAS = SIDXSeas
    ).

* TIMSS index: Teacher job satisfaction.
RECODE
    BTDGLSN
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDGLSN
        0 'Less than satisfied'
        1 'Satisfied'
        2 'Very satisfied'.
MISSING VALUES
    BTDGLSN
        (-99).
RENAME VARIABLES (
    BTDGLSN = IDXLimit
    ).

* TIMSS index: Teaching limited by students not ready.
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
    BTDGSOS = IDXSafe
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
    BTDGTJS = IDXJob
    ).

* TIMSS index: Teachers Emphis on Science Investigation.
RECODE
    BTDSESI
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDSESI
        0 'Less than Half the Lessons'
        1 'About Half the Lessons or More'.
MISSING VALUES
    BTDSESI
        (-99).
RENAME VARIABLES (
    BTDSESI = IDXExprm
    ).

* Percent of teachers majored in education and science.
RECODE
    BTDSMSE
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BTDSMSE
        0 'No Formal Education Beyond Upper Secondary'
        1 'All Other Majors'
        2 'Major in Science Education but not in Science'
        3 'Major in Science but not in Science Education'
        4 'Major in Science and Science Education'.
MISSING VALUES
    BTDSMSE
        (-99).
RENAME VARIABLES (
    BTDSMSE = STchMjr
    ).

* Percent of students taught science topics.
RECODE
    BTDSBIO
        (996.000000=-99) (999.000000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDSBIO
        (-99).
RENAME VARIABLES (
    BTDSBIO = PTpBio
    ).

* Percent of students taught science topics.
RECODE
    BTDSCHE
        (996.000000=-99) (999.000000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDSCHE
        (-99).
RENAME VARIABLES (
    BTDSCHE = PTpChe
    ).

* Percent of students taught science topics.
RECODE
    BTDSPHY
        (996.000000=-99) (999.000000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDSPHY
        (-99).
RENAME VARIABLES (
    BTDSPHY = PTpPht
    ).

* Percent of students taught science topics.
RECODE
    BTDSEAR
        (996.000000=-99) (999.000000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BTDSEAR
        (-99).
RENAME VARIABLES (
    BTDSEAR = PTpEar
    ).

* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\5_TIMSS_2019_G8_S_clean\TIMSS_2019_G8_S_clean.sav".

***** End script *****
