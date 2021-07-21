* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 21 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--Student

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: Student
* Grade: Grade 4
* Subject: Math and Science

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\2_TIMSS_2019_G4_clean\TIMSS_2019_G4_clean.sav".

**************************
** Student variables **
**************************

* G1: Student gender.
RECODE
    ASBG01
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBG01
        (-99).
RENAME VARIABLES (
    ASBG01 = GendBoy
    ).

* G2: Studen birth year and month. No action required.

* G3: Student language at home.
RECODE
    ASBG03
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG03
        0 'I never speak <language of test> at home'
        1 'I sometimes speak <language of test> and sometimes speak another language at home'
        2 'I almost always speak <language of test> at home'
        3 'I always speak <language of test> at home'.
MISSING VALUES
    ASBG03
        (-99).
RENAME VARIABLES (
    ASBG03 = StdLang
    ).

* G4: SES: Number of books at home.
RECODE
    ASBG04
         (1=0) (2=1) (3=2) (4=3) (5=4) 
         (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG04 
       0 'None or very few (0--10 books)'
       1 'Enough to fill one shelf (11--25 books)'
       2 'Enough to fill one bookcase (26--100 books)'
       3 'Enough to fill two bookcases (101--200 books)'
       4 'Enough to fill three or more bookcases (more than 200)'.
MISSING VALUES
    ASBG04
        (-99).
RENAME VARIABLES (
    ASBG04 = SESBook
    ).

* G5: SES: Home possession.
RECODE
    ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99). 
VALUE LABELS
    ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I
        0 'No'
        1 'Yes'.
MISSING VALUES 
    ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I
        (-99).
RENAME VARIABLES (
    ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I
    =       
    SESComp SESDesk SESRoom SESInter SESPhone SESCnt1 SESCnt2 SESCnt3 SESCnt4
    ).
    
* G6: Parents' country of birth.
RECODE
    ASBG06A ASBG06B
        (1=0) (2=1) (3=2) (4=3)  
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG06A ASBG06B
        0 'Yes'
        1 'No'
        2 'I do not know'
        3 'Not applicable'.
MISSING VALUES
    ASBG06A ASBG06B
        (-99).
RENAME VARIABLES (
    ASBG06A ASBG06B
    =
    FaBorn MoBorn
    ).

* G7: Student's country of birth.
RECODE
    ASBG07
    (1=0) (2=1)
    (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG07
        0 'Yes'
        1 'No'.
MISSING VALUES
    ASBG07
        (-99).
RENAME VARIABLES (
    ASBG07 = StdBorn
    ).

* G8: Student absenteism.
RECODE
    ASBG08
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG08
        0 'Never or almost never'
        1 'Once every two months'
        2 'Once a month'
        3 'Once every two weeks'
        4 'Once a week'.
MISSING VALUES
    ASBG08
        (-99).
RENAME VARIABLES (
    ASBG08 = Absent
    ).

* G9: Student tired and hungry.
RECODE
    ASBG09A ASBG09B
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG09A ASBG09B
        0 'Never'
        1 'Sometimes'
        2 'Almost every day'
        3 'Every day'.
MISSING VALUES
    ASBG09A ASBG09B
        (-99).
RENAME VARIABLES (
    ASBG09A ASBG09B
    =
    Tired Hungry
    ).

* G10: Student sense of belonging.
RECODE
    ASBG10A ASBG10B ASBG10C ASBG10D ASBG10E
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBG10A ASBG10B ASBG10C ASBG10D ASBG10E
        (-99).
RENAME VARIABLES (
    ASBG10A ASBG10B ASBG10C ASBG10D ASBG10E
    =
    BlgLike BlgSafe BlgSch BlgFair BlgProud
    ).

* G11: Bullying.
RECODE
    ASBG11A ASBG11B ASBG11C ASBG11D ASBG11E ASBG11F
    ASBG11G ASBG11H ASBG11I ASBG11J ASBG11K
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBG11A ASBG11B ASBG11C ASBG11D ASBG11E ASBG11F
    ASBG11G ASBG11H ASBG11I ASBG11J ASBG11K
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'At least once a week'.
MISSING VALUES
    ASBG11A ASBG11B ASBG11C ASBG11D ASBG11E ASBG11F
    ASBG11G ASBG11H ASBG11I ASBG11J ASBG11K
        (-99).
RENAME VARIABLES (
    ASBG11A ASBG11B ASBG11C ASBG11D ASBG11E ASBG11F
    ASBG11G ASBG11H ASBG11I ASBG11J ASBG11K
    =
    BlyFun BlyLeft BlyLies BlySteal BlyDamge BlyHit
    BlyForce BlyMsg BlyRmr BlyPics BlyThrt
    ).

* MS1: Math work problem.
RECODE
    ASBM01
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBM01
        0 'Never'
        1 'Some lesons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    ASBM01
        (-99).
RENAME VARIABLES (
    ASBM01 = WorkProb
    ).

* MS2: Intrinsic motivation for learning math.
RECODE
    ASBM02A ASBM02B ASBM02C ASBM02D ASBM02E ASBM02F ASBM02G ASBM02H ASBM02I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBM02A ASBM02B ASBM02C ASBM02D ASBM02E ASBM02F ASBM02G ASBM02H ASBM02I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBM02A ASBM02B ASBM02C ASBM02D ASBM02E ASBM02F ASBM02G ASBM02H ASBM02I
        (-99).
RENAME VARIABLES (
    ASBM02A ASBM02B ASBM02C ASBM02D ASBM02E ASBM02F ASBM02G ASBM02H ASBM02I
    =
    MEnjoy MNotStdy MBorng MIntrst MLike MWrkNum MProblem MLokFrwd MFavSub 
    ).

* MS3: Math teaching: Teacher support.
RECODE
    ASBM03A ASBM03B ASBM03C ASBM03D ASBM03E ASBM03F
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBM03A ASBM03B ASBM03C ASBM03D ASBM03E ASBM03F
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBM03A ASBM03B ASBM03C ASBM03D ASBM03E ASBM03F
        (-99).
RENAME VARIABLES (
    ASBM03A ASBM03B ASBM03C ASBM03D ASBM03E ASBM03F
    =
    MTcExp MTcEasy MTcClear MTcGood MTcVary MTcExpA
    ).
    
* MS4: Math teaching: Classroom management.
RECODE
    ASBM04A ASBM04B ASBM04C ASBM04D ASBM04E ASBM04F
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBM04A ASBM04B ASBM04C ASBM04D ASBM04E ASBM04F
        0 'Never'
        1 'Some lessons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    ASBM04A ASBM04B ASBM04C ASBM04D ASBM04E ASBM04F
        (-99).
RENAME VARIABLES (
    ASBM04A ASBM04B ASBM04C ASBM04D ASBM04E ASBM04F
    =
    MTcListen MTcNoise MTcDisor MTcQuiet MTcIntrpt MTcRule
    ).

* MS5: Self concept for math.
RECODE
    ASBM05A ASBM05B ASBM05C ASBM05D ASBM05E ASBM05F ASBM05G ASBM05H ASBM05I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBM05A ASBM05B ASBM05C ASBM05D ASBM05E ASBM05F ASBM05G ASBM05H ASBM05I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBM05A ASBM05B ASBM05C ASBM05D ASBM05E ASBM05F ASBM05G ASBM05H ASBM05I
        (-99).
RENAME VARIABLES (
    ASBM05A ASBM05B ASBM05C ASBM05D ASBM05E ASBM05F ASBM05G ASBM05H ASBM05I
    =
    MSCWell MSCHard MSCNoGod MSCLearn MSCNervs MSCWork MSCGood MSCHard MSCConfs
    ).

* MS6: Science experiment.
RECODE
    ASBS06
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATBM04BA ATBM04BB ATBM04BC
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'At least once a week'.
MISSING VALUES
    ATBM04BA ATBM04BB ATBM04BC
        (-99).
RENAME VARIABLES (
    ATBM04BA ATBM04BB ATBM04BC
    =
    MPCStd MPCClas MPCSch
    ).

* MS7: Intrinsic motivation for learning science.
RECODE
    ASBS07A ASBS07B ASBS07C ASBS07D ASBS07E ASBS07F ASBS07G ASBS07H ASBS07I
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBS07A ASBS07B ASBS07C ASBS07D ASBS07E ASBS07F ASBS07G ASBS07H ASBS07I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBS07A ASBS07B ASBS07C ASBS07D ASBS07E ASBS07F ASBS07G ASBS07H ASBS07I
        (-99).
RENAME VARIABLES (
    ASBS07A ASBS07B ASBS07C ASBS07D ASBS07E ASBS07F ASBS07G ASBS07H ASBS07I
    =
    SEnjoy SNotStdy SBorng SIntrst SLike SLokFrwd STeach SSciEx SFavSub
    ).

* MS8: Science teaching: Teacher support.
RECODE
     ASBS08A ASBS08B ASBS08C ASBS08D ASBS08E ASBS08F
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBS08A ASBS08B ASBS08C ASBS08D ASBS08E ASBS08F
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBS08A ASBS08B ASBS08C ASBS08D ASBS08E ASBS08F
        (-99).
RENAME VARIABLES (
    ASBS08A ASBS08B ASBS08C ASBS08D ASBS08E ASBS08F
    =
    STcExp STcEasy STcClear STcGood STcVary STcExpA
    ).

* MS9: Self concept for science.
RECODE
    ASBS09A ASBS09B ASBS09C ASBS09D ASBS09E ASBS09F ASBS09G
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBS09A ASBS09B ASBS09C ASBS09D ASBS09E ASBS09F ASBS09G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBS09A ASBS09B ASBS09C ASBS09D ASBS09E ASBS09F ASBS09G
        (-99).
RENAME VARIABLES (
    ASBS09A ASBS09B ASBS09C ASBS09D ASBS09E ASBS09F ASBS09G
    =
    SSCWell SSCHard SSCNoGod SSCLearn SSCGood SSCHardMe SSCConfs
    ).

* e1A: Like test on computer or tablet.
RECODE
    ASBE01A
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBE01A
        0 'I did not like it at all'
        1 'I did not like it very much'
        2 'I liked it a little'
        3 'I liked it a lot'.
MISSING VALUES
    ASBE01A
        (-99).
RENAME VARIABLES (
    ASBE01A = CBALike
    ).

* e1B: Difficulties in computer based testing.
RECODE
    ASBE01BA ASBE01BB ASBE01BC ASBE01BD ASBE01BE ASBE01BF
        (1=1) (2=0) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBE01BA ASBE01BB ASBE01BC ASBE01BD ASBE01BE ASBE01BF
        0 'No'
        1 'Yes'.
MISSING VALUES
    ASBE01BA ASBE01BB ASBE01BC ASBE01BD ASBE01BE ASBE01BF
        (-99).
RENAME VARIABLES (
    ASBE01BA ASBE01BB ASBE01BC ASBE01BD ASBE01BE ASBE01BF
    =
    CBAType CBAPad CBADrag CBAPlace CBASlow CBAProb
    ).

* e2: Using computer or tablet for school work.
RECODE
    ASBE02A ASBE02B ASBE02C ASBE02D
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBE02A ASBE02B ASBE02C ASBE02D
        0 'Never or almost never'
        1 'Once or twice a month'
        2 'Once or twice a week'
        3 'Every day or almost every day'.
MISSING VALUES
    ASBE02A ASBE02B ASBE02C ASBE02D
        (-99).
RENAME VARIABLES (
    ASBE02A ASBE02B ASBE02C ASBE02D
    =
    PCSchAss PCMatSch PCSciSch PCQuiz
    ).

* e3: Student familiarity in using computer or tablet.
RECODE
    ASBE03A ASBE03B ASBE03C ASBE03D ASBE03E ASBE03F ASBE03G
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBE03A ASBE03B ASBE03C ASBE03D ASBE03E ASBE03F ASBE03G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBE03A ASBE03B ASBE03C ASBE03D ASBE03E ASBE03F ASBE03G
        (-99).
RENAME VARIABLES (
    ASBE03A ASBE03B ASBE03C ASBE03D ASBE03E ASBE03F ASBE03G
    =
    PCGood PCType PCScreen PCInfo PCWord PCParag PCText
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

* TIMSS compound variables: SEAS.
RECODE
    ATBGEAS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATBGEAS
        (-99).
RENAME VARIABLES (
    ATBGEAS = SCLSeas
    ).

RECODE
    ATDGEAS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDGEAS
        0 'Medium emphasis'
        1 'High emphasis'
        2 'Very high emphasis'.
MISSING VALUES
    ATDGEAS
        (-99).
RENAME VARIABLES (
    ATDGEAS = IDXSeas
    ).

* TIMSS compound variables: Safe and orderly school.
RECODE
    ATBGSOS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATBGSOS
        (-99).
RENAME VARIABLES (
    ATBGSOS = SCLSafe
    ).

RECODE
    ATDGSOS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDGSOS
        0 'Less than safe and orderly'
        1 'Somewhat safe and orderly'
        2 'Very safe and orderly'.
MISSING VALUES
    ATDGSOS
        (-99).
RENAME VARIABLES (
    ATDGSOS = IDXSafe
    ).

* TIMSS compound variables: Teacher job satisfaction.
RECODE
    ATBGTJS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATBGTJS
        (-99).
RENAME VARIABLES (
    ATBGTJS = SCLJob
    ).

RECODE
    ATDGTJS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDGTJS
        0 'Less than satisfied'
        1 'Somewhat satisfied'
        2 'Very satisfied'.
MISSING VALUES
    ATDGTJS
        (-99).
RENAME VARIABLES (
    ATDGTJS = IDXJob
    ).

* TIMSS compound variables: Teaching limited by students not ready.
RECODE
    ATBGLSN
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATBGLSN
        (-99).
RENAME VARIABLES (
    ATBGLSN = SCLLimit
    ).

RECODE
    ATDGLSN
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDGLSN
        0 'A lot'
        1 'Some'
        2 'Very little'.
MISSING VALUES
    ATDGLSN
        (-99).
RENAME VARIABLES (
    ATDGLSN = IDXLimit
    ).

* TIMSS compound variables: Teacher emphasis on science investigation.
RECODE
    ATBSESI
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATBSESI
        (-99).
RENAME VARIABLES (
    ATBSESI = SCLExprm
    ).

RECODE
    ATDSESI
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDSESI
        0 'Less than half the lessons'
        1 'About half the lessons or more'.
MISSING VALUES
    ATDSESI
        (-99).
RENAME VARIABLES (
    ATDSESI = IDXExprm
    ).

* Percent of students taught math topics.
RECODE
    ATDMNUM ATDMGEO ATDMDAT
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATDMNUM ATDMGEO ATDMDAT
        (-99).
RENAME VARIABLES (
    ATDMNUM ATDMGEO ATDMDAT
    =
    PTpNumb PTpGeo PTpData
    ).

* Percent of teachers majored in education and math.
RECODE
    ATDMMEM
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDMMEM
        0 'No formal education beyond upper secondary'
        1 'All other majors'
        2 'Major in mathematics but not education'
        3 'Major in education but not mathematics'
        4 'Major in education and mathematics'.
MISSING VALUES
    ATDMMEM
        (-99).
RENAME VARIABLES (
    ATDMMEM = MTchMjr
    ).

* Percent of students taught science topics.
RECODE
    ATDSLIF ATDSPHY ATDSEAR
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ATDSLIF ATDSPHY ATDSEAR
        (-99).
RENAME VARIABLES (
    ATDSLIF ATDSPHY ATDSEAR
    =
    PTpLife PTpPhys PTpEarth
    ).

* Percent of teachers majored in education and science.
RECODE
    ATDSMES
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ATDSMES
        0 'No formal education beyond upper secondary'
        1 'All other majors'
        2 'Major in science but not education'
        3 'Major in education but not science'
        4 'Major in education and science'.
MISSING VALUES
    ATDSMES
        (-99).
RENAME VARIABLES (
    ATDSMES = STchMjr
    ).



* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\2_TIMSS_2019_G4_clean\TIMSS_2019_G4_clean.sav".

***** End script *****
