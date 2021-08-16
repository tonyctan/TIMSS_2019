* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 24 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--Student

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: Student
* Grade: Grade 8
* Subject: Math

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\4_TIMSS_2019_G8_M_clean\TIMSS_2019_G8_M_clean.sav".

**************************
** Student variables **
**************************

* G1: Student gender.
RECODE
    BSBG01
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBG01
        (-99).
RENAME VARIABLES (
    BSBG01 = GendBoy
    ).

* G2: Studen birth year and month. No action required.

* G3: Student language at home.
RECODE
    BSBG03
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG03
        0 'Never'
        1 'Sometimes'
        2 'Almost always'
        3 'Always'.
MISSING VALUES
    BSBG03
        (-99).
RENAME VARIABLES (
    BSBG03 = StdLang
    ).

* G4: SES: Number of books at home.
RECODE
    BSBG04
        (1=0) (2=1) (3=2) (4=3) (5=4) 
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG04 
        0 'None or very few (0--10 books)'
        1 'Enough to fill one shelf (11--25 books)'
        2 'Enough to fill one bookcase (26--100 books)'
        3 'Enough to fill two bookcases (101--200 books)'
        4 'Enough to fill three or more bookcases (more than 200)'.
MISSING VALUES
    BSBG04
        (-99).
RENAME VARIABLES (
    BSBG04 = SESBook
    ).

* G5: SES: Home possession.
RECODE
    BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99). 
VALUE LABELS
    BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I
        0 'No'
        1 'Yes'.
MISSING VALUES 
    BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I
        (-99).
RENAME VARIABLES (
    BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I
    =       
    SESComp SESDesk SESRoom SESInter SESPhone SESCnt1 SESCnt2 SESCnt3 SESCnt4
    ).

* G6: Parental education.
RECODE
    BSBG06A BSBG06B
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=7) (9=8)
        (8=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG06A BSBG06B
        0 'Some <Primary education—ISCED Level 1 or Lower secondary education—ISCED Level 2> or did not go to school'
        1 '<Lower secondary education—ISCED Level 2>'
        2 '<Upper secondary education—ISCED Level 3>'
        3 '<Post-secondary, non-tertiary education—ISCED Level 4>'
        4 '<Short-cycle tertiary education—ISCED Level 5>'
        5 '<Bachelor’s or equivalent level—ISCED Level 6>'
        6 '<Postgraduate degree: Master’s—ISCED Level 7 or Doctor —ISCED Level 8>'
        7 'I do not know'.
MISSING VALUES
    BSBG06A BSBG06B
        (-99).
RENAME VARIABLES (
    BSBG06A BSBG06B
    =
    FaEdu MoEdu
    ).

* G7: Student educational expectation.
RECODE
    BSBG07
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG07
        0 'Finish <Lower secondary education--ISCED Level 2>'
        1 'Finish <Upper secondary education--ISCED Level 3>'
        2 'Finish <Post-secondary, non-tertiary education--ISCED Level 4>'
        3 'Finish <Short-cycle tertiary education--ISCED Level 5>'
        4 'Finish <Bachelors or equivalent level--ISCED Level 6>'
        5 'Finish <Postgraduate degree: Masters--ISCED Level 7 or Doctor —ISCED Level 8>'.
MISSING VALUES
    BSBG07
        (-99).
RENAME VARIABLES (
    BSBG07 = StdEdu
    ).

* G8: Parents' country of birth.
RECODE
    BSBG08A BSBG08B
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG08A BSBG08B
        1 'Yes'
        0 'No'
        2 'I do not know'
        4 'Not applicable'.
MISSING VALUES
    BSBG08A BSBG08B
        (-99).
RENAME VARIABLES (
    BSBG08A BSBG08B
    =
    FaBorn MoBorn
    ).

* G9A: Student's country of birth.
RECODE
    BSBG09A
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG09A
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSBG09A
        (-99).
RENAME VARIABLES (
    BSBG09A = StdBorn
    ).

* G9B: Student's age entering the country.
RECODE
    BSBG09B
        (1=2) (2=1) (3=0) 
        (6=-99)(9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG09B
        0 'Younger than 5 years old'
        1 '5 to 10 years old'
        2 'Older than 10 years old'.
MISSING VALUES
    BSBG09B
        (-99).
RENAME VARIABLES (
    BSBG09B = AgeCnt
    ).

* G10: Student absenteism.
RECODE
    BSBG10
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG10
        0 'Never or almost never'
        1 'Once every two months'
        2 'Once a month'
        3 'Once every two weeks'
        4 'Once a week'.
MISSING VALUES
    BSBG10
        (-99).
RENAME VARIABLES (
    BSBG10 = Absent
    ).

* G11: Student tired and hungry.
RECODE
    BSBG11A BSBG11B
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG11A BSBG11B
        0 'Never'
        1 'Sometimes'
        2 'Almost every day'
        3 'Every day'.
MISSING VALUES
    BSBG11A BSBG11B
        (-99).
RENAME VARIABLES (
    BSBG11A BSBG11B
    =
    Tired Hungry
    ).

* G12: Internet use.
RECODE
    BSBG12A BSBG12B BSBG12C BSBG12D BSBG12E BSBG12F
        (1=0) (2=1)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG12A BSBG12B BSBG12C BSBG12D BSBG12E BSBG12F 
        0 'Yes'
        1 'No'.
MISSING VALUES
    BSBG12A BSBG12B BSBG12C BSBG12D BSBG12E BSBG12F
        (-99).
RENAME VARIABLES (
    BSBG12A BSBG12B BSBG12C BSBG12D BSBG12E BSBG12F
    =
    IntBook IntTask IntPeer IntTeach IntAid IntGame
    ).

* G13: Student sense of belonging.
RECODE
    BSBG13A BSBG13B BSBG13C BSBG13D BSBG13E
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG13A BSBG13B BSBG13C BSBG13D BSBG13E
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBG13A BSBG13B BSBG13C BSBG13D BSBG13E
        (-99).
RENAME VARIABLES (
    BSBG13A BSBG13B BSBG13C BSBG13D BSBG13E
    =
    BlgLike BlgSafe BlgSch BlgFair BlgProud
    ).

* G14: Bullying.
RECODE
    BSBG14A BSBG14B BSBG14C BSBG14D BSBG14E BSBG14F BSBG14G
    BSBG14H BSBG14I BSBG14J BSBG14K BSBG14L BSBG14M BSBG14N
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBG14A BSBG14B BSBG14C BSBG14D BSBG14E BSBG14F BSBG14G
    BSBG14H BSBG14I BSBG14J BSBG14K BSBG14L BSBG14M BSBG14N
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'At least once a week'.
MISSING VALUES
    BSBG14A BSBG14B BSBG14C BSBG14D BSBG14E BSBG14F BSBG14G
    BSBG14H BSBG14I BSBG14J BSBG14K BSBG14L BSBG14M BSBG14N
        (-99).
RENAME VARIABLES (
    BSBG14A BSBG14B BSBG14C BSBG14D BSBG14E BSBG14F BSBG14G
    BSBG14H BSBG14I BSBG14J BSBG14K BSBG14L BSBG14M BSBG14N
    =
    BlyMean BlyLies BlyScrt BlyNoTlk BlyInslt BlySteal BlyForce
    BlyHurt BlyOnln BlyPics BlyThrt BlyPHurt BlyExcl BlyDamge
    ).

* G15: Math work problem.
RECODE
    BSBM15
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM15
        0 'Never'
        1 'Some lessons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    BSBM15
        (-99).
RENAME VARIABLES (
    BSBM15 = WorkProb
    ).

* G16: Intrinsic motivation for learning math.
RECODE
    BSBM16A BSBM16B BSBM16C BSBM16D BSBM16E
    BSBM16F BSBM16G BSBM16H BSBM16I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM16A BSBM16B BSBM16C BSBM16D BSBM16E
    BSBM16F BSBM16G BSBM16H BSBM16I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBM16A BSBM16B BSBM16C BSBM16D BSBM16E
    BSBM16F BSBM16G BSBM16H BSBM16I
        (-99).
RENAME VARIABLES (
    BSBM16A BSBM16B BSBM16C BSBM16D BSBM16E
    BSBM16F BSBM16G BSBM16H BSBM16I
    =
    MEnjoy MNotStdy MBorng MIntrst MLike
    MWrkNum MProblem MLokFrwd MFavSub
    ).

* G17: Math teaching: Teacher support.
RECODE
    BSBM17A BSBM17B BSBM17C BSBM17D
    BSBM17E BSBM17F BSBM17G
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM17A BSBM17B BSBM17C BSBM17D
    BSBM17E BSBM17F BSBM17G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBM17A BSBM17B BSBM17C BSBM17D
    BSBM17E BSBM17F BSBM17G
        (-99).
RENAME VARIABLES (
    BSBM17A BSBM17B BSBM17C BSBM17D
    BSBM17E BSBM17F BSBM17G
    =
    MTcExp MTcEasy MTcClear MTcGood
    MTcVary MTcLink MTcExpA
    ).

* G18: Math teaching: Classroom management.
RECODE
    BSBM18A BSBM18B BSBM18C BSBM18D BSBM18E BSBM18F
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM18A BSBM18B BSBM18C BSBM18D BSBM18E BSBM18F
        0 'Never'
        1 'Some lessons'
        2 'About half the lessons'
        3 'Every or almost every lesson'.
MISSING VALUES
    BSBM18A BSBM18B BSBM18C BSBM18D BSBM18E BSBM18F
        (-99).
RENAME VARIABLES (
    BSBM18A BSBM18B BSBM18C BSBM18D BSBM18E BSBM18F
    =
    MTcListen MTcNoise MTcDisor MTcQuiet MTcIntrpt MTcRule
    ).

* G19: Self concept for math.
RECODE
    BSBM19A BSBM19B BSBM19C BSBM19D BSBM19E
    BSBM19F BSBM19G BSBM19H BSBM19I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM19A BSBM19B BSBM19C BSBM19D BSBM19E
    BSBM19F BSBM19G BSBM19H BSBM19I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBM19A BSBM19B BSBM19C BSBM19D BSBM19E
    BSBM19F BSBM19G BSBM19H BSBM19I
        (-99).
RENAME VARIABLES (
    BSBM19A BSBM19B BSBM19C BSBM19D BSBM19E
    BSBM19F BSBM19G BSBM19H BSBM19I
    =
    MSCWell MSCHMate MSCNoStr MSCLearn MSCNervs
    MSCWork MSCGood MSCHSubj MSCConfs 
    ).

* G20: Extrinsic motivation for learning math.
RECODE
    BSBM20A BSBM20B BSBM20C BSBM20D BSBM20E
    BSBM20F BSBM20G BSBM20H BSBM20I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM20A BSBM20B BSBM20C BSBM20D BSBM20E
    BSBM20F BSBM20G BSBM20H BSBM20I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBM20A BSBM20B BSBM20C BSBM20D BSBM20E
    BSBM20F BSBM20G BSBM20H BSBM20I
        (-99).
RENAME VARIABLES (
    BSBM20A BSBM20B BSBM20C BSBM20D BSBM20E
    BSBM20F BSBM20G BSBM20H BSBM20I
    =
    MXHelp MXLrnOth MXUniv MXForJob MXMtJob
    MXAhead MXJObOp MXParent MXImpWel
    ).

* G21: Science experiment.
RECODE
    BSBS21
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBS21
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'At least once a week'.
MISSING VALUES
    BSBS21
        (-99).
RENAME VARIABLES (
    BSBS21 = SConExpr
    ).

* G22: Intrinsic motivation for learning science.
RECODE
    BSBS22A BSBS22B BSBS22C BSBS22D BSBS22E
    BSBS22F BSBS22G BSBS22H BSBS22I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBS22A BSBS22B BSBS22C BSBS22D BSBS22E
    BSBS22F BSBS22G BSBS22H BSBS22I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBS22A BSBS22B BSBS22C BSBS22D BSBS22E
    BSBS22F BSBS22G BSBS22H BSBS22I
        (-99).
RENAME VARIABLES (
    BSBS22A BSBS22B BSBS22C BSBS22D BSBS22E
    BSBS22F BSBS22G BSBS22H BSBS22I
    =
    SEnjoy SNotStdy SBorng SIntrst SLike
    SLokFrwd STeach SSciEx SFavSub
    ).

* G23: Science teaching: Teacher support.
RECODE
    BSBS23A BSBS23B BSBS23C BSBS23D BSBS23E BSBS23F BSBS23G
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBS23A BSBS23B BSBS23C BSBS23D BSBS23E BSBS23F BSBS23G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBS23A BSBS23B BSBS23C BSBS23D BSBS23E BSBS23F BSBS23G
        (-99).
RENAME VARIABLES (
    BSBS23A BSBS23B BSBS23C BSBS23D BSBS23E BSBS23F BSBS23G
    =
    STcExp STcEasy STcClear STcGood STcVary STcLink STcExpA
    ).

* G24: Self concept for science.
RECODE
    BSBS24A BSBS24B BSBS24C BSBS24D
    BSBS24E BSBS24F BSBS24G BSBS24H
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBS24A BSBS24B BSBS24C BSBS24D
    BSBS24E BSBS24F BSBS24G BSBS24H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBS24A BSBS24B BSBS24C BSBS24D
    BSBS24E BSBS24F BSBS24G BSBS24H
        (-99).
RENAME VARIABLES (
    BSBS24A BSBS24B BSBS24C BSBS24D
    BSBS24E BSBS24F BSBS24G BSBS24H
    =
    SSCWell SSCHard SSCNoGod SSCLearn
    SSCGDif SSCGTea SSCHardMe SSCConfs
    ).

* G25: Integrated science: Extrinsic motivation.
RECODE
    BSBS25A BSBS25B BSBS25C BSBS25D BSBS25E
    BSBS25F BSBS25G BSBS25H BSBS25I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBS25A BSBS25B BSBS25C BSBS25D BSBS25E
    BSBS25F BSBS25G BSBS25H BSBS25I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBS25A BSBS25B BSBS25C BSBS25D BSBS25E
    BSBS25F BSBS25G BSBS25H BSBS25I
        (-99).
RENAME VARIABLES (
    BSBS25A BSBS25B BSBS25C BSBS25D BSBS25E
    BSBS25F BSBS25G BSBS25H BSBS25I
    =
    SHelp SLrnOth SUniv SForJob SMtJob
    SAhead SJObOp SParent SImpWel 
    ).

* G26A: Integrated science: Homework occurences.
RECODE
    BSBM26AA BSBS26AB
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM26AA BSBS26AB
        0 'Never'
        1 'Less than once a week'
        2 '1 or 2 times a week'
        3 '3 or 4 times a week'
        4 'Eevryday'.
MISSING VALUES
    BSBM26AA BSBS26AB
        (-99).
RENAME VARIABLES (
    BSBM26AA BSBS26AB
    =
    MatHwOf SciHwOf 
    ).

* G26B: Integrated science: Time on homework.
RECODE
    BSBM26BA BSBS26BB
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM26BA BSBS26BB
        0 'My teacher never gives me homework in'
        1 '1-15 minutes'
        2 '16-30 minutes'
        3 '31-60 minutes'
        4 '61-90 minutes'
        5 'More than 90 minutes'.
MISSING VALUES
    BSBM26BA BSBS26BB
        (-99).
RENAME VARIABLES (
    BSBM26BA BSBS26BB
    =
    MatHwTm SciHwTm
    ).

* G27A: Integrated science: Extra lesson.
RECODE
    BSBM27AA BSBS27AB
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM27AA BSBS27AB
        0 'No'
        1 'Yes, to keep up in class'
        2 'Yes to excel in class'.
MISSING VALUES
    BSBM27AA BSBS27AB
        (-99).
RENAME VARIABLES (
    BSBM27AA BSBS27AB
    =
    MatExtr SciExtr
    ).

* G27B: Integrated science: Extra lesson occurences.
RECODE
    BSBM27BA BSBS27BB
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM27BA BSBS27BB
        0 'Did not attend'
        1 'Less than 4 months'
        2 '4-8 months'
        3 'More than 8 months'.
MISSING VALUES
    BSBM27BA BSBS27BB
        (-99).
RENAME VARIABLES (
    BSBM27BA BSBS27BB
    =
    MatXtrOf SciXtrOf
    ).

* GB21: Attending biology class.
RECODE
    BSBB21
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBB21
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSBB21
        (-99).
RENAME VARIABLES (
    BSBB21 = BioClass
    ).

* GB22: Biology experiment.
RECODE
    BSBB22
        (1=3) (2=2) (3=1) (4=0)
        (6=-99)(9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBB22
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'A few times a year'
        4 'At least once a week'.
MISSING VALUES
    BSBB22
        (-99).
RENAME VARIABLES (
    BSBB22 = BConExpr
    ).

* GB23: Biology: Intrinsic motivation.
RECODE
    BSBB23A BSBB23B BSBB23C BSBB23D BSBB23E
    BSBB23F BSBB23G BSBB23H BSBB23I
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBB23A BSBB23B BSBB23C BSBB23D BSBB23E
    BSBB23F BSBB23G BSBB23H BSBB23I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBB23A BSBB23B BSBB23C BSBB23D BSBB23E
    BSBB23F BSBB23G BSBB23H BSBB23I
        (-99).
RENAME VARIABLES (
    BSBB23A BSBB23B BSBB23C BSBB23D BSBB23E
    BSBB23F BSBB23G BSBB23H BSBB23I
    =
    BEnjoy BNotStdy BBorng BIntrst BLike
    BLokFrwd BTeach BSciEx BFavSub
    ).

* GB24: Biology teaching: Teacher support.
RECODE
    BSBB24A BSBB24B BSBB24C BSBB24D BSBB24E BSBB24F BSBB24G
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBB24A BSBB24B BSBB24C BSBB24D BSBB24E BSBB24F BSBB24G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBB24A BSBB24B BSBB24C BSBB24D BSBB24E BSBB24F BSBB24G
        (-99).
RENAME VARIABLES (
    BSBB24A BSBB24B BSBB24C BSBB24D BSBB24E BSBB24F BSBB24G
    =
    BTcExp BTcEasy BTcClear BTcGood BTcVary BTcLink BTcExpA
    ).

* GB25: Biology: Self concept.
RECODE
    BSBB25A BSBB25B BSBB25C BSBB25D
    BSBB25E BSBB25F BSBB25G BSBB25H
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBB25A BSBB25B BSBB25C BSBB25D
    BSBB25E BSBB25F BSBB25G BSBB25H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBB25A BSBB25B BSBB25C BSBB25D
    BSBB25E BSBB25F BSBB25G BSBB25H
        (-99).
RENAME VARIABLES (
    BSBB25A BSBB25B BSBB25C BSBB25D
    BSBB25E BSBB25F BSBB25G BSBB25H
    =
    BSCWell BSCHard BSCNoGod BSCLearn
    BSCGDif BSCGTea BSCHardMe BSCConfs 
    ).

* GE26: Attending earth science class.
RECODE
    BSBE26
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE26
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSBE26
        (-99).
RENAME VARIABLES (
    BSBE26 = EarClass
    ).

* GE27: Biology experiment.
RECODE
    BSBE27
        (1=3) (2=2) (3=1) (4=0)
        (6=-99)(9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE27
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'A few times a year'
        4 'At least once a week'.
MISSING VALUES
    BSBE27
        (-99).
RENAME VARIABLES (
    BSBE27 = EConExpr
    ).

* GE28: Earth science: Intrinsic motivation.
RECODE
    BSBE28A BSBE28B BSBE28C BSBE28D BSBE28E
    BSBE28F BSBE28G BSBE28H BSBE28I
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE28A BSBE28B BSBE28C BSBE28D BSBE28E
    BSBE28F BSBE28G BSBE28H BSBE28I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBE28A BSBE28B BSBE28C BSBE28D BSBE28E
    BSBE28F BSBE28G BSBE28H BSBE28I
        (-99).
RENAME VARIABLES (
    BSBE28A BSBE28B BSBE28C BSBE28D BSBE28E
    BSBE28F BSBE28G BSBE28H BSBE28I
    =
    EEnjoy ENotStdy EBorng EIntrst ELike
    ELokFrwd ETeach ESciEx EFavSub
    ).

* GE29: Biology teaching: Teacher support.
RECODE
    BSBE29A BSBE29B BSBE29C BSBE29D BSBE29E BSBE29F BSBE29G
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE29A BSBE29B BSBE29C BSBE29D BSBE29E BSBE29F BSBE29G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBE29A BSBE29B BSBE29C BSBE29D BSBE29E BSBE29F BSBE29G
        (-99).
RENAME VARIABLES (
    BSBE29A BSBE29B BSBE29C BSBE29D BSBE29E BSBE29F BSBE29G
    =
    ETcExp ETcEasy ETcClear ETcGood ETcVary ETcLink ETcExpA
    ).

* GE30: Biology: Self concept.
RECODE
    BSBE30A BSBE30B BSBE30C BSBE30D
    BSBE30E BSBE30F BSBE30G BSBE30H
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE30A BSBE30B BSBE30C BSBE30D
    BSBE30E BSBE30F BSBE30G BSBE30H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBE30A BSBE30B BSBE30C BSBE30D
    BSBE30E BSBE30F BSBE30G BSBE30H
        (-99).
RENAME VARIABLES (
    BSBE30A BSBE30B BSBE30C BSBE30D
    BSBE30E BSBE30F BSBE30G BSBE30H
    =
    BESCWell ESCHard ESCNoGod ESCLearn
    ESCGDif ESCGTea ESCHardMe ESCConfs
    ).

* GC31: Attending Chemistry class.
RECODE
    BSBC31
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBC31
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSBC31
        (-99).
RENAME VARIABLES (
    BSBC31 = CheClass
    ).

* GC32: Chemistry experiment.
RECODE
    BSBC32
        (1=3) (2=2) (3=1) (4=0)
        (6=-99)(9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBC32
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'A few times a year'
        4 'At least once a week'.
MISSING VALUES
    BSBC32
        (-99).
RENAME VARIABLES (
    BSBC32 = CConExpr
    ).

* GC33: Chemistry: Intrinsic motivation.
RECODE
    BSBC33A BSBC33B BSBC33C BSBC33D BSBC33E
    BSBC33F BSBC33G BSBC33H BSBC33I
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBC33A BSBC33B BSBC33C BSBC33D BSBC33E
    BSBC33F BSBC33G BSBC33H BSBC33I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBC33A BSBC33B BSBC33C BSBC33D BSBC33E
    BSBC33F BSBC33G BSBC33H BSBC33I
        (-99).
RENAME VARIABLES (
    BSBC33A BSBC33B BSBC33C BSBC33D BSBC33E
    BSBC33F BSBC33G BSBC33H BSBC33I
    =
    CEnjoy CNotStdy CBorng CIntrst CLike
    CLokFrwd CTeach CSciEx CFavSub
    ).

* GC34: Chemistry teaching: Teacher support.
RECODE
    BSBC34A BSBC34B BSBC34C BSBC34D BSBC34E BSBC34F BSBC34G
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBC34A BSBC34B BSBC34C BSBC34D BSBC34E BSBC34F BSBC34G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBC34A BSBC34B BSBC34C BSBC34D BSBC34E BSBC34F BSBC34G
        (-99).
RENAME VARIABLES (
    BSBC34A BSBC34B BSBC34C BSBC34D BSBC34E BSBC34F BSBC34G
    =
    CTcExp CTcEasy CTcClear CTcGood CTcVary CTcLink CTcExpA
    ).

* GC35: Chemistry: Self concept.
RECODE
    BSBC35A BSBC35B BSBC35C BSBC35D
    BSBC35E BSBC35F BSBC35G BSBC35H
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBC35A BSBC35B BSBC35C BSBC35D
    BSBC35E BSBC35F BSBC35G BSBC35H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBC35A BSBC35B BSBC35C BSBC35D
    BSBC35E BSBC35F BSBC35G BSBC35H
        (-99).
RENAME VARIABLES (
    BSBC35A BSBC35B BSBC35C BSBC35D
    BSBC35E BSBC35F BSBC35G BSBC35H
    =
    CSCWell CSCHard CSCNoGod CSCLearn
    CSCGDif CSCGTea CSCHardMe CSCConfs
    ).

* GP36: Attending physics class.
RECODE
    BSBP36
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBP36
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSBP36
        (-99).
RENAME VARIABLES (
    BSBP36 = PhyClass
    ).

* GP37: Physics experiment.
RECODE
    BSBP37
        (1=3) (2=2) (3=1) (4=0)
        (6=-99)(9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBP37
        0 'Never'
        1 'A few times a year'
        2 'Once or twice a month'
        3 'A few times a year'
        4 'At least once a week'.
MISSING VALUES
    BSBP37
        (-99).
RENAME VARIABLES (
    BSBP37 = PConExpr
    ).

* GP38: Physics: Intrinsic motivation.
RECODE
    BSBP38A BSBP38B BSBP38C BSBP38D BSBP38E
    BSBP38F BSBP38G BSBP38H BSBP38I
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBP38A BSBP38B BSBP38C BSBP38D BSBP38E
    BSBP38F BSBP38G BSBP38H BSBP38I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBP38A BSBP38B BSBP38C BSBP38D BSBP38E
    BSBP38F BSBP38G BSBP38H BSBP38I
        (-99).
RENAME VARIABLES (
    BSBP38A BSBP38B BSBP38C BSBP38D BSBP38E
    BSBP38F BSBP38G BSBP38H BSBP38I
    =
    PEnjoy PNotStdy PBorng PIntrst PLike
    PLokFrwd PTeach PSciEx PFavSub
    ).

* GP39: Physics teaching: Teacher support.
RECODE
    BSBP39A BSBP39B BSBP39C BSBP39D BSBP39E BSBP39F BSBP39G
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBP39A BSBP39B BSBP39C BSBP39D BSBP39E BSBP39F BSBP39G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBP39A BSBP39B BSBP39C BSBP39D BSBP39E BSBP39F BSBP39G
        (-99).
RENAME VARIABLES (
    BSBP39A BSBP39B BSBP39C BSBP39D BSBP39E BSBP39F BSBP39G
    =
    PTcExp PTcEasy PTcClear PTcGood PTcVary PTcLink PTcExpA
    ).

* GS40: Physics: Self concept.
RECODE
    BSBP40A BSBP40B BSBP40C BSBP40D
    BSBP40E BSBP40F BSBP40G BSBP40H
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBP40A BSBP40B BSBP40C BSBP40D
    BSBP40E BSBP40F BSBP40G BSBP40H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBP40A BSBP40B BSBP40C BSBP40D
    BSBP40E BSBP40F BSBP40G BSBP40H
        (-99).
RENAME VARIABLES (
    BSBP40A BSBP40B BSBP40C BSBP40D
    BSBP40E BSBP40F BSBP40G BSBP40H
    =
    PSCWell PSCHard PSCNoGod PSCLearn
    PSCGDif PSCGTea PSCHardMe PSCConfs
    ).

* GSS41: Separate science: Extrinsic motivation.
RECODE
    BSBS41A BSBS41B BSBS41C BSBS41D BSBS41E
    BSBS41F BSBS41G BSBS41H BSBS41I
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBS41A BSBS41B BSBS41C BSBS41D BSBS41E
    BSBS41F BSBS41G BSBS41H BSBS41I
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBS41A BSBS41B BSBS41C BSBS41D BSBS41E
    BSBS41F BSBS41G BSBS41H BSBS41I
        (-99).
RENAME VARIABLES (
    BSBS41A BSBS41B BSBS41C BSBS41D BSBS41E
    BSBS41F BSBS41G BSBS41H BSBS41I
    =
    SXHelp SXLrnOth SXUniv SXForJob SXMtJob
    SXAhead SXJObOp SXParent SXImpWel
    ).

* GSS42A: Separate science:  Homework occurences.
RECODE
    BSBM42AA BSBB42AB BSBE42AC BSBC42AD BSBP42AE
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM42AA BSBB42AB BSBE42AC BSBC42AD BSBP42AE
        0 'Never'
        1 'Less than once a week'
        2 '1 or 2 times a week'
        3 '3 or 4 times a week'
        4 'Eevryday'.
MISSING VALUES
    BSBM42AA BSBB42AB BSBE42AC BSBC42AD BSBP42AE
        (-99).
RENAME VARIABLES (
    BSBM42AA BSBB42AB BSBE42AC BSBC42AD BSBP42AE
    =
    SMatHwOf BioHwOf EarHwOf CheHwOf PhyHwOf
    ).

* GSS42B: Separate science: Time on homework.
RECODE
    BSBM42BA BSBB42BB BSBE42BC BSBC42BD BSBP42BE
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM42BA BSBB42BB BSBE42BC BSBC42BD BSBP42BE
        0 'My teacher never gives me homework in'
        1 '1-15 minutes'
        2 '16-30 minutes'
        3 '31-60 minutes'
        4 '61-90 minutes'
        5 'More than 90 minutes'.
MISSING VALUES
    BSBM42BA BSBB42BB BSBE42BC BSBC42BD BSBP42BE
        (-99).
RENAME VARIABLES (
    BSBM42BA BSBB42BB BSBE42BC BSBC42BD BSBP42BE
    =
    MSMatHwTm BioHwTm EarHwTm CheHwTm PhyHwTm
    ).

* GSS43A: Separate science: Extra lesson.
RECODE
    BSBM43AA BSBS43AB
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM43AA BSBS43AB
        0 'No'
        1 'Yes, to keep up in class'
        2 'Yes to excel in class'.
MISSING VALUES
    BSBM43AA BSBS43AB
        (-99).
RENAME VARIABLES (
    BSBM43AA BSBS43AB
    =
    SMatExtr SSciExtr
    ).

* GSS43B: Separate science: Extra lesson occurences.
RECODE
    BSBM43BA BSBS43BB
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBM43BA BSBS43BB
        0 'Did not attend'
        1 'Less than 4 months'
        2 '4-8 months'
        3 'More than 8 months'.
MISSING VALUES
    BSBM43BA BSBS43BB
        (-99).
RENAME VARIABLES (
    BSBM43BA BSBS43BB
    =
    SMatXtrOf SSciXtrOf
    ).

* eTIMMS1A: Like test on computer or tablet.
RECODE
    BSBE01A
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE01A
        0 'I did not like it at all'
        1 'I did not like it very much'
        2 'I liked it a little'
        3 'I liked it a lot'.
MISSING VALUES
    BSBE01A
        (-99).
RENAME VARIABLES (
    BSBE01A = CBALike
    ).

* eTIMMS1B: Difficulties in computer based testing.
RECODE
    BSBE01BA BSBE01BB BSBE01BC BSBE01BD BSBE01BE BSBE01BF
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE01BA BSBE01BB BSBE01BC BSBE01BD BSBE01BE BSBE01BF
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSBE01BA BSBE01BB BSBE01BC BSBE01BD BSBE01BE BSBE01BF
        (-99).
RENAME VARIABLES (
    BSBE01BA BSBE01BB BSBE01BC BSBE01BD BSBE01BE BSBE01BF
    =
    CBAType CBAPad CBADrag CBAPlace CBASlow CBAProb
    ).

* eTIMMS2: Using computer or tablet for school work.
RECODE
    BSBE02A BSBE02B BSBE02C BSBE02D
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE02A BSBE02B BSBE02C BSBE02D
        0 'Never or almost never'
        1 'Once or twice a month'
        2 'Once or twice a week'
        3 'Everyday or almost everyday'.
MISSING VALUES
    BSBE02A BSBE02B BSBE02C BSBE02D
        (-99).
RENAME VARIABLES (
    BSBE02A BSBE02B BSBE02C BSBE02D
    =
    PCSchAss PCMatSch PCSciSch PCQuiz
    ).

* eTIMMS3: Student familiarity in using computer or tablet.
RECODE
    BSBE03A BSBE03B BSBE03C BSBE03D BSBE03E BSBE03F BSBE03G
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE03A BSBE03B BSBE03C BSBE03D BSBE03E BSBE03F BSBE03G
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BSBE03A BSBE03B BSBE03C BSBE03D BSBE03E BSBE03F BSBE03G
        (-99).
RENAME VARIABLES (
    BSBE03A BSBE03B BSBE03C BSBE03D BSBE03E BSBE03F BSBE03G
    =
    PCGood PCType PCScreen PCInfo PCWord PCParag PCText
    ).

* eTIMMS4: Knowledge of ICT terms.
RECODE
    BSBE04A BSBE04B BSBE04C BSBE04D BSBE04E BSBE04F BSBE04G BSBE04H
        (1=3) (2=2) (3=1) (4=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSBE04A BSBE04B BSBE04C BSBE04D BSBE04E BSBE04F BSBE04G BSBE04H
        0 'Not at all'
        1 'A little'
        2 'Well'
        3 'Very well'.
MISSING VALUES
    BSBE04A BSBE04B BSBE04C BSBE04D BSBE04E BSBE04F BSBE04G BSBE04H
        (-99).
RENAME VARIABLES (
    BSBE04A BSBE04B BSBE04C BSBE04D BSBE04E BSBE04F BSBE04G BSBE04H
    =
    KnWifi KnFirewl KnInMsg KnCurPst KnSprdSh KnIcon KnDrgDrp KnScrol
    ).

**************************
** Demographics **
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

* Locale ID of student achievment test.
RECODE
    LCID_SA
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    LCID_SA
        (-99).

* Student gender.
FREQUENCIES
    GendBoy
    ITSEX BSDAGE
        /FORMAT NOTABLE.
* ITSEX != BSBG01 (renamed to GendBoy). Do not delete ITSEX. Rename to SexBoy, then ask Nani.

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
    ITSEX = SexBoy
    ).

* Student age.
RECODE
    BSDAGE
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSDAGE
        (-99).
RENAME VARIABLES (
    BSDAGE = StdAge
    ).

* Test administrator position.
RECODE
    ITADMINI
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ITADMINI
        0 'National Center Staff'
        1 'Teacher from School'
        2 'Other'.
MISSING VALUES
    ITADMINI
        (-99).
RENAME VARIABLES (
    ITADMINI = TestAdm
    ).

RECODE
    WGTADJ1 WGTADJ2 WGTADJ3
    WGTFAC1 WGTFAC2 WGTFAC3
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    WGTADJ1 WGTADJ2 WGTADJ3
    WGTFAC1 WGTFAC2 WGTFAC3
        (-99).

**************************
** Compound Variables **
**************************

* TIMSS construct: Home Resources for Learning.
RECODE
    BSBGHER
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGHER
        (-99).
RENAME VARIABLES (
    BSBGHER = SCLHmSES
    ).

* TIMSS construct: Home Resources for Learning.
RECODE
    BSDGHER
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGHER
        0 'Few resources'
        1 'Some resources'
        2 'Many resources'.
MISSING VALUES
    BSDGHER
        (-99).
RENAME VARIABLES (
    BSDGHER = IDXHmSES
    ).

* TIMSS construct: Students Sense of School Belonging.
RECODE
    BSBGSSB
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSSB
        (-99).
RENAME VARIABLES (
    BSBGSSB = SCLBlong
    ).

* TIMSS construct: Students Sense of School Belonging.
RECODE
    BSDGSSB
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSSB
        0 'Little sense of school belonging'
        1 'Some sense of school belonging'
        2 'High sense of school belonging'.
MISSING VALUES
    BSDGSSB
        (-99).
RENAME VARIABLES (
    BSDGSSB = IDXBlong
    ).

* TIMSS construct: Bullying.
RECODE
    BSBGSB
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSB
        (-99).
RENAME VARIABLES (
    BSBGSB = SCBully
    ).

* TIMSS construct: Bullying.
RECODE
    BSDGSB
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSB
        0 'Never or almost never'
        1 'About monthly'
        2 'About weekly'.
MISSING VALUES
    BSDGSB
        (-99).
RENAME VARIABLES (
    BSDGSB = IDXBully
    ).

* TIMSS construct: Students Like Learning Mathematics.
RECODE
    BSBGSLM
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSLM
        (-99).
RENAME VARIABLES (
    BSBGSLM = SCLLikeM
    ).

* TIMSS construct: Students Like Learning Mathematics.
RECODE
    BSDGSLM
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSLM
        0 'Do not like learning mathematics'
        1 'Somewhat like learning mathematics'
        2 'Very much like learning mathematics'.
MISSING VALUES
    BSDGSLM
        (-99).
RENAME VARIABLES (
    BSDGSLM = IDXLikeM
    ).

* TIMSS construct: Instructional Clarity in Mathematics Lessons.
RECODE
    BSBGICM
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGICM
        (-99).
RENAME VARIABLES (
    BSBGICM = SCLClrtM
    ).

* TIMSS construct: Instructional Clarity in Mathematics Lessons.
RECODE
    BSDGICM
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGICM
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    BSDGICM
        (-99).
RENAME VARIABLES (
    BSDGICM = IDXClrtM
    ).

* TIMSS construct: Disorderly Behavior during Math Lesson.
RECODE
    BSBGDML
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGDML
        (-99).
RENAME VARIABLES (
    BSBGDML = SCLDisor
    ).

* TIMSS construct: Disorderly Behavior during Math Lesson.
RECODE
    BSDGDML
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGDML
        0 'Few or no lessons'
        1 'Some lessons'
        2 'Most lessons'.
MISSING VALUES
    BSDGDML
        (-99).
RENAME VARIABLES (
    BSDGDML = IDXDisor
    ).

* TIMSS construct: Students Confident in Mathematics.
RECODE
    BSBGSCM
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSCM
        (-99).
RENAME VARIABLES (
    BSBGSCM = SCLConfM
    ).

* TIMSS construct: Students Confident in Mathematics.
RECODE
    BSDGSCM
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSCM
        0 'Not confident in mathematics'
        1 'Somewhat in mathematics'
        2 'Very confident in mathematics'.
MISSING VALUES
    BSDGSCM
        (-99).
RENAME VARIABLES (
    BSDGSCM = IDXConfM
    ).

* TIMSS construct: Students value math.
RECODE
    BSBGSVM
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSVM
        (-99).
RENAME VARIABLES (
    BSBGSVM = SCLValM
    ).

* TIMSS construct: Students value math.
RECODE
    BSDGSVM
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSVM
        0 'Do not value mathematics'
        1 'Somewhat value mathematics'
        2 'Strongly value mathwmatics'.
MISSING VALUES
    BSDGSVM
        (-99).
RENAME VARIABLES (
    BSDGSVM = IDXValM
    ).

* TIMSS construct: Students Like Learning Science.
RECODE
    BSBGSLS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSLS
        (-99).
RENAME VARIABLES (
    BSBGSLS = SCLLikeS
    ).

* TIMSS construct: Students Like Learning Science.
RECODE
    BSDGSLS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSLS
        0 'Do not like learning science'
        1 'Somewhat like learning science'
        2 'Very much like learning science'.
MISSING VALUES
    BSDGSLS
        (-99).
RENAME VARIABLES (
    BSDGSLS = IDXLikeS
    ).

* TIMSS construct: Instructional Clarity in Science Lessons.
RECODE
    BSBGICS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGICS
        (-99).
RENAME VARIABLES (
    BSBGICS = SCLClrtS
    ).

* TIMSS construct: Instructional Clarity in Science Lessons.
RECODE
    BSDGICS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGICS
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    BSDGICS
        (-99).
RENAME VARIABLES (
    BSDGICS = IDXClrtS
    ).

* TIMSS construct: Students Confident in Science.
RECODE
    BSBGSCS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSCS
        (-99).
RENAME VARIABLES (
    BSBGSCS = SCLConfS
    ).

* TIMSS construct: Students Confident in Science.
RECODE
    BSDGSCS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSCS
        0 'Not confident in science'
        1 'Somewhat in science'
        2 'Very confident in mscience'.
MISSING VALUES
    BSDGSCS
        (-99).
RENAME VARIABLES (
    BSDGSCS = IDXConfS
    ).

* TIMSS construct: Students value science.
RECODE
    BSBGSVS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSVS
        (-99).
RENAME VARIABLES (
    BSBGSVS = SCLValS
    ).

* TIMSS construct: Students value science.
RECODE
    BSDGSVS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSVS
        0 'Do not value science'
        1 'Somewhat value science'
        2 'Strongly value science'.
MISSING VALUES
    BSDGSVS
        (-99).
RENAME VARIABLES (
    BSDGSVS = IDXValS
    ).

* TIMSS construct: Students like biology.
RECODE
    BSBGSLB
       (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSLB
        (-99).
RENAME VARIABLES (
    BSBGSLB = SCLLikeB
    ).

* TIMSS construct: Students like biology.
RECODE
    BSDGSLB
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSLB
        0 'Do not like learning biology'
        1 'Somewhat like learning biology'
        2 'Very much like learning biology'.
MISSING VALUES
    BSDGSLB
        (-99).
RENAME VARIABLES (
    BSDGSLB = IDXLikeB
    ).

* TIMSS construct: Instructional Clarity in Biology Lessons.
RECODE
    BSBGICB
       (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGICB
        (-99).
RENAME VARIABLES (
    BSBGICB = SCLClrtB
    ).

* TIMSS construct: Instructional Clarity in Biology Lessons.
RECODE
    BSDGICB
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGICB
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    BSDGICB
        (-99).
RENAME VARIABLES (
    BSDGICB = IDXClrtB
    ).

* TIMSS construct: Students Confident in Biology.
RECODE
    BSBGSCB
       (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSCB
        (-99).
RENAME VARIABLES (
    BSBGSCB = SCLConfB
    ).

* TIMSS construct: Students Confident in Biology.
RECODE
    BSDGSCB
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSCB
        0 'Not confident in biology'
        1 'Somewhat in biology'
        2 'Very confident in biology'.
MISSING VALUES
    BSDGSCB
        (-99).
RENAME VARIABLES (
    BSDGSCB = IDXConfB
    ).

* TIMSS construct: Students like earth science.
RECODE
    BSBGSLE
       (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSLE
        (-99).
RENAME VARIABLES (
    BSBGSLE = SCLLikeE
    ).

* TIMSS construct: Students like earth science.
RECODE
    BSDGSLE
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSLE
        0 'Do not like learning earth science'
        1 'Somewhat like learning earth science'
        2 'Very much like learning earth science'.
MISSING VALUES
    BSDGSLE
        (-99).
RENAME VARIABLES (
    BSDGSLE = IDXLikeE
    ).

* TIMSS construct: Instructional Clarity in earth science Lessons.
RECODE
    BSBGICE
       (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGICE
        (-99).
RENAME VARIABLES (
    BSBGICE = SCLClrtE
    ).

* TIMSS construct: Instructional Clarity in earth science Lessons.
RECODE
    BSDGICE
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGICE
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    BSDGICE
        (-99).
RENAME VARIABLES (
    BSDGICE = IDXClrtE
    ).

* TIMSS construct: Students Confident in earth science.
RECODE
    BSBGSCE
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSCE
        (-99).
RENAME VARIABLES (
    BSBGSCE = SCLConfE
    ).

* TIMSS construct: Students Confident in earth science.
RECODE
    BSDGSCE
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSCE
        0 'Not confident in earth science'
        1 'Somewhat in earth science'
        2 'Very confident in earth science'.
MISSING VALUES
    BSDGSCE
        (-99).
RENAME VARIABLES (
    BSDGSCE = IDXConfE
    ).

* TIMSS construct: Students like chemistry.
RECODE
    BSBGSLC
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSLC
        (-99).
RENAME VARIABLES (
    BSBGSLC = SCLLikeC
    ).

* TIMSS construct: Students like chemistry.
RECODE
    BSDGSLC
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSLC
        0 'Do not like learning chemistry'
        1 'Somewhat like learning chemistry'
        2 'Very much like learning chemistry'.
MISSING VALUES
    BSDGSLC
        (-99).
RENAME VARIABLES (
    BSDGSLC = IDXLikeC
    ).


* TIMSS construct: Instructional Clarity in chemistry Lessons.
RECODE
    BSBGICC
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGICC
        (-99).
RENAME VARIABLES (
    BSBGICC = SCLClrtC
    ).

* TIMSS construct: Instructional Clarity in chemistry Lessons.
RECODE
    BSDGICC
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGICC
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    BSDGICC
        (-99).
RENAME VARIABLES (
    BSDGICC = IDXClrtC
    ).

* TIMSS construct: Students Confident in chemistry.
RECODE
    BSBGSCC
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSCC
        (-99).
RENAME VARIABLES (
    BSBGSCC = SCLConfC
    ).

* TIMSS construct: Students Confident in chemistry.
RECODE
    BSDGSCC
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSCC
        0 'Not confident in chemistry'
        1 'Somewhat in chemistry'
        2 'Very confident in chemistry'.
MISSING VALUES
    BSDGSCC
        (-99).
RENAME VARIABLES (
    BSDGSCC = IDXConfC
    ).

* TIMSS construct: Students like physics.
RECODE
    BSBGSLP
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSLP
        (-99).
RENAME VARIABLES (
    BSBGSLP = SCLLikeP
    ).

* TIMSS construct: Students like physics.
RECODE
    BSDGSLP
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSLP
        0 'Do not like learning physics'
        1 'Somewhat like learning physics'
        2 'Very much like learning physics'.
MISSING VALUES
    BSDGSLP
        (-99).
RENAME VARIABLES (
    BSDGSLP = IDXLikeP
    ).

* TIMSS construct: Instructional Clarity in physics Lessons.
RECODE
    BSBGICP
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGICP
        (-99).
RENAME VARIABLES (
    BSBGICP = SCLClrtP
    ).

* TIMSS construct: Instructional Clarity in physics Lessons.
RECODE
    BSDGICP
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGICP
        0 'Low clarity of instruction'
        1 'Moderate clarity of instruction'
        2 'High clarity of instruction'.
MISSING VALUES
    BSDGICP
        (-99).
RENAME VARIABLES (
    BSDGICP = IDXClrtP
    ).

* TIMSS construct: Students Confident in physics.
RECODE
    BSBGSCP
        (999999.00000=-99) (999996.00000=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSCP
        (-99).
RENAME VARIABLES (
    BSBGSCP = SCLConfP
    ).

* TIMSS construct: Students Confident in physics.
RECODE
    BSDGSCP
        (1=2) (2=1) (3=0)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSCP
        0 'Not confident in physics'
        1 'Somewhat in physics'
        2 'Very confident in physics'.
MISSING VALUES
    BSDGSCP
        (-99).
RENAME VARIABLES (
    BSDGSCP = IDXConfP
    ).

* TIMSS construct: Self-Efficacy for Computer Use.
RECODE
    BSBGSEC
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSBGSEC
        (-99).
RENAME VARIABLES (
    BSBGSEC = SCLcomSE
    ).

* TIMSS construct: Self-Efficacy for Computer Use.
RECODE
    BSDGSEC
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGSEC
        0 'Low self-efficacy'
        1 'Medium self-efficacy'
        2 'High self-efficacy'.
MISSING VALUES
    BSDGSEC
        (-99).
RENAME VARIABLES (
    BSDGSEC = IDXcomSE
    ).

* Number of Home Study Supports.
RECODE
    BSDG05S
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BSDG05S
        (-99).
RENAME VARIABLES (
    BSDG05S = NStudSup
    ).

* Parental education.
RECODE
    BSDGEDUP
        (1=5) (2=4) (3=3) (4=2) (5=1) (6=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDGEDUP
        0 'Do not know'
        1 'Some Primary, Lower Secondary or No School'
        2 'Lower Secondary'
        3 'Upper Secondary'
        4 'Post-secondary but not University'
        5 'University or Higher'.
MISSING VALUES
    BSDGEDUP
        (-99).
RENAME VARIABLES (
    BSDGEDUP = ParEdu
    ).

* Mathematics Ach Too Low for Estimation.
RECODE
    BSDMLOWP
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDMLOWP
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSDMLOWP
        (-99).
RENAME VARIABLES (
    BSDMLOWP = MAchLow
    ).

* Science Ach Too Low for Estimation.
RECODE
    BSDSLOWP
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BSDSLOWP
        0 'No'
        1 'Yes'.
MISSING VALUES
    BSDSLOWP
        (-99).
RENAME VARIABLES (
    BSDSLOWP = SAchLow
    ).

* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\4_TIMSS_2019_G8_M_clean\TIMSS_2019_G8_M_clean.sav".

***** End script *****
