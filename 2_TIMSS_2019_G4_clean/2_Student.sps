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

* Language of student context questionnaire.
RECODE
    ITLANG_SQ
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ITLANG_SQ
        (-99).

* Locale ID of student context questionnaire.
RECODE
    LCID_SQ
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    LCID_SQ
        (-99).

* Language of student achievement test.
RECODE
    ITLANG_SA
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ITLANG_SA
        (-99).

* Locale ID of student achievement test.
RECODE
    LCID_SA
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    LCID_SA
        (-99).

* Student gender.
RECODE
    ITSEX
        (1=0) (2=1)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ITSEX
        0 'Female'
        1 'Male'.
MISSING VALUES
    ITSEX
        (-99).
RENAME VARIABLES (
    ITSEX = GendBoy
    ).

* Student age.
RECODE
    ASDAGE
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASDAGE
        (-99).
RENAME VARIABLES (
    ASDAGE = StdAge
    ).

* Test administrator postion.
RECODE
    ITADMINI
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ITADMINI
        0 'National center staff'
        1 'Teacher from school'
        2 'Other'.
MISSING VALUES
    ITADMINI
        (-99).
RENAME VARIABLES (
    ITADMINI = TestAdm
    ).

* Check for missing values in weights.
FREQUENCIES
    WGTADJ1 WGTADJ2 WGTADJ3 WGTFAC1 WGTFAC2 WGTFAC3
        /FORMAT = NOTABLE.
* Good! Nothing is missing. No re-coding needed either. No further action.


* TIMSS construct: Disorderly behavior during math lesson.
RECODE
    ASBGDML
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBGDML
        (-99).
RENAME VARIABLES (
    ASBGDML = SCLDisor
    ).

* TIMSS construct: Disorderly behavior during math lesson.
RECODE
    ASDGDML
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDGDML
        0 'Few or no lessons'
        1 'Some lessons'
        2 'Most lessons'.
MISSING VALUES
    ASDGDML
        (-99).
RENAME VARIABLES (
    ASDGDML = IDXDisor
    ).

* TIMSS construct: Instructional clarity in mathematics lessons.
RECODE
    ASBGICM
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBGICM
        (-99).
RENAME VARIABLES (
    ASBGICM = SCLClrtM
    ).

* TIMSS construct: Instructional clarity in mathematics lessons.
RECODE
    ASDGICM
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDGICM
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    ASDGICM
        (-99).
RENAME VARIABLES (
    ASDGICM = IDXClrtM
    ).

* TIMSS construct: Student sense of school belonging.
RECODE
    ASBGSSB
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBGSSB
        (-99).
RENAME VARIABLES (
    ASBGSSB = SCLBlong
    ).

* TIMSS construct: Student sense of school belonging.
RECODE
    ASDGSSB
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDGSSB
        0 'Little sense of school belonging'
        1 'Some sense of school belonging'
        2 'High sense of school belonging'.
MISSING VALUES
    ASDGSSB
        (-99).
RENAME VARIABLES (
    ASDGSSB = IDXBlong
    ).

* TIMSS construct: Bullying.
RECODE
    ASBGSB
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBGSB
        (-99).
RENAME VARIABLES (
    ASBGSB = SCLBully
    ).

* TIMSS construct: Bullying.
RECODE
    ASDGSB
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDGSB
        0 'Never or almost never'
        1 'About monthly'
        2 'About weekly'.
MISSING VALUES
    ASDGSB
        (-99).
RENAME VARIABLES (
    ASDGSB = IDXBully
    ).









* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\2_TIMSS_2019_G4_clean\TIMSS_2019_G4_clean.sav".

***** End script *****
