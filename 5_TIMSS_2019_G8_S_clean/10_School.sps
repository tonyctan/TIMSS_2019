* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 23 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--School

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: School
* Grade: Grade 8
* Subject: Science

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\5_TIMSS_2019_G8_S_clean\TIMSS_2019_G8_S_clean.sav".

**************************
** School variables **
**************************

* 3: Percentage of disadvantaged students attending the school.
RECODE
    BCBG03A BCBG03B
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG03A BCBG03B
        0 '0 to 10%'
        1 '11 to 25%'
        2 '26 to 50%'
        3 'More than 50%'.
MISSING VALUES
    BCBG03A BCBG03B
        (-99).
RENAME VARIABLES (
    BCBG03A BCBG03B
    =
    SchDisad SchEco
    ).

* 4: Percentage of students having the language of test as their native language.
RECODE
    BCBG04
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG04
        0 '25% or less'
        1 '26 to 50%'
        2 '51 to 75%'
        3 '76 to 90%'
        4 'More than 90%'.
MISSING VALUES
    BCBG04
        (-99).
RENAME VARIABLES (
    BCBG04 = SchLang
    ).

* 5A: Number of people live in the school area.
RECODE
    BCBG05A
        (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) (7=0)
        (99=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG05A
        0 '3,000 people or fewer'
        1 '3,001 to 15,000 people'
        2 '15,001 to 30,000 people'
        3 '30,001 to 50,000 people'
        4 '50,001 to 100,000 people'
        5 '100,001 to 500,000 people'
        6 'More than 500,000 people'.
MISSING VALUES
    BCBG05A
        (-99).
RENAME VARIABLES (
    BCBG05A = SchPop
    ).

* 5B: School location.
RECODE
    BCBG05B
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBG05B
        (-99).
RENAME VARIABLES (
    BCBG05B = SchArea
    ).

* 6A and 6B: Instructional time.
RECODE
    BCBG06A BCBG06B
        (999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBG06A BCBG06B
        (-99).
RENAME VARIABLES (
    BCBG06A BCBG06B
    =
    SchDays SchTime
    ).

* 6C: Instructional time.
RECODE
    BCBG06C
        (1=4) (2=3) (3=2) (4=1) (5=0) (6=5)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG06C
        0 '4 days'
        1 '4 1/2 days'
        2 '5 days'
        3 '5 1/2 days'
        4 '6 days'
        5 'Other'.
MISSING VALUES
    BCBG06C
        (-99).
RENAME VARIABLES (
    BCBG06C = InstDay
    ).

* 7: Number of computers at school.
RECODE
    BCBG07
        (9999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBG07
        (-99).
RENAME VARIABLES (
    BCBG07 = NumComp
    ).

* 8A: Science laborat.
* 8B: Available assisstant for experiment.
* 9: Access to learning management system.
* 10A: School library.
RECODE
    BCBG08A BCBG08B BCBG09 BCBG10A
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG08A BCBG08B BCBG09 BCBG10A
        0 'No'
        1 'Yes'.
MISSING VALUES
    BCBG08A BCBG08B BCBG09 BCBG10A
        (-99).
RENAME VARIABLES (
    BCBG08A BCBG08B BCBG09 BCBG10A
    =
    SciLab AssLab NettLMS Library
    ).

* 10B: The number of books in the library.
RECODE
    BCBG10B
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBG10B
        (-99).
RENAME VARIABLES (
    BCBG10B = ManyBook
    ).

* 11: Classroom library.
* 12: Access to digital learning resources.
RECODE
    BCBG11 BCBG12
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG11 BCBG12
        0 'No'
        1 'Yes'.
MISSING VALUES
    BCBG11 BCBG12
        (-99).
RENAME VARIABLES (
    BCBG11 BCBG12
    =
    LibClass DgtlLearn
    ).

* 13: Shortage affecting school’s capacity to provide general instruction.
RECODE
    BCBG13AA BCBG13AB BCBG13AC BCBG13AD BCBG13AE BCBG13AF BCBG13AG BCBG13AH BCBG13AI
    BCBG13BA BCBG13BB BCBG13BC BCBG13BD BCBG13BE
    BCBG13CA BCBG13CB BCBG13CC BCBG13CD BCBG13CE
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG13AA BCBG13AB BCBG13AC BCBG13AD BCBG13AE BCBG13AF BCBG13AG BCBG13AH BCBG13AI
    BCBG13BA BCBG13BB BCBG13BC BCBG13BD BCBG13BE
    BCBG13CA BCBG13CB BCBG13CC BCBG13CD BCBG13CE
        0 'Not at all'
        1 'A little'
        2 'Some'
        3 'A lot'.
MISSING VALUES
    BCBG13AA BCBG13AB BCBG13AC BCBG13AD BCBG13AE BCBG13AF BCBG13AG BCBG13AH BCBG13AI
    BCBG13BA BCBG13BB BCBG13BC BCBG13BD BCBG13BE
    BCBG13CA BCBG13CB BCBG13CC BCBG13CD BCBG13CE
        (-99).
RENAME VARIABLES (
    BCBG13AA BCBG13AB BCBG13AC BCBG13AD BCBG13AE BCBG13AF BCBG13AG BCBG13AH BCBG13AI
    BCBG13BA BCBG13BB BCBG13BC BCBG13BD BCBG13BE
    BCBG13CA BCBG13CB BCBG13CC BCBG13CD BCBG13CE
    =
    SrtMatrl SrtSuply SrtBuild SrtHeat SrtSpace SrtTech SrtAudio SrtComp SrtDisab
    SrtMTch SrtMComp SrtMLib SrtMCal SrtMEqu
    SrtSTch SrtSComp SrtSLib SrtSCal SrtSEqu
    ).

* 14: School emphasis on academic success.
RECODE
    BCBG14A BCBG14B BCBG14C BCBG14D BCBG14E BCBG14F
    BCBG14G BCBG14H BCBG14I BCBG14J BCBG14K
        (1=4) (2=3) (3=2) (4=1) (5=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG14A BCBG14B BCBG14C BCBG14D BCBG14E BCBG14F
    BCBG14G BCBG14H BCBG14I BCBG14J BCBG14K
        0 'Very low'
        1 'Low'
        2 'Medium'
        3 'High'
        4 'Very high'.
MISSING VALUES
    BCBG14A BCBG14B BCBG14C BCBG14D BCBG14E BCBG14F
    BCBG14G BCBG14H BCBG14I BCBG14J BCBG14K
        (-99).
RENAME VARIABLES (
    BCBG14A BCBG14B BCBG14C BCBG14D BCBG14E BCBG14F
    BCBG14G BCBG14H BCBG14I BCBG14J BCBG14K
    =
    CSTchUnd CSTchSuc CSTchExp CSTchIns CSParInv CSParCom
    CSPaeExp CSParSupp CSStdWell CSStdGoal CSStdResp
    ).

* 15: Math and science programs in school.
RECODE
    BCBG15A BCBG15B BCBG15C BCBG15D
    BCBG15E BCBG15F BCBG15G BCBG15H
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG15A BCBG15B BCBG15C BCBG15D
    BCBG15E BCBG15F BCBG15G BCBG15H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    BCBG15A BCBG15B BCBG15C BCBG15D
    BCBG15E BCBG15F BCBG15G BCBG15H
        (-99).
RENAME VARIABLES (
    BCBG15A BCBG15B BCBG15C BCBG15D
    BCBG15E BCBG15F BCBG15G BCBG15H
    =
    PrgInfo PrgIntrs PrgPD PrgXtLes
    PrgSpcAc PrgSpcGo PrgEncgSt PrgXtTim
    ).

* 16: School discipline and safety.
RECODE
    BCBG16A BCBG16B BCBG16C BCBG16D BCBG16E
    BCBG16F BCBG16G BCBG16H BCBG16I BCBG16J BCBG16K
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG16A BCBG16B BCBG16C BCBG16D BCBG16E
    BCBG16F BCBG16G BCBG16H BCBG16I BCBG16J BCBG16K
        0 'Not a problem'
        1 'Minor problem'
        2 'Moderate problem'
        3 'Serious problem'.
MISSING VALUES
    BCBG16A BCBG16B BCBG16C BCBG16D BCBG16E
    BCBG16F BCBG16G BCBG16H BCBG16I BCBG16J BCBG16K
        (-99).
RENAME VARIABLES (
    BCBG16A BCBG16B BCBG16C BCBG16D BCBG16E
    BCBG16F BCBG16G BCBG16H BCBG16I BCBG16J BCBG16K
    =
    SDLate SDAbsnt SDDistrb SDCheat SDProfnt SDVandl
    SDTheft SDIntim SDInjuSt SDAbuse SDInjuTc
    ).

* 17: Teacher problem.
RECODE
    BCBG17A BCBG17B
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG17A BCBG17B
        0 'Not a problem'
        1 'Minor problem'
        2 'Moderate problem'
        3 'Serious problem'.
MISSING VALUES
    BCBG17A BCBG17B
        (-99).
RENAME VARIABLES (
    BCBG17A BCBG17B
    =
    TchLate TchAbsent
    ).

* 18 and 19: Principal years of experience.
RECODE
    BCBG18 BCBG19
        (1=0) (2=1) (3=2) (4=3)
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBG18 BCBG19
        (-99).
RENAME VARIABLES (
    BCBG18 BCBG19
    =
    PrcplYear PrYearSc
    ).

* 20: Principal highest level of education.
RECODE
    BCBG20
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG20
        0 'Did not complete <Bachelor’s or equivalent level--ISCED Level 6>'
        1 '<Bachelor’s or equivalent level--ISCED Level 6>'
        2 '<Master’s or equivalent level--ISCED Level 7>'
        3 '<Doctor or equivalent level--ISCED Level 8>'.
MISSING VALUES
    BCBG20
        (-99).
RENAME VARIABLES (
    BCBG20 = PrEdu
    ).

* 21: Principal qualification in educational leadership.
RECODE
    BCBG21A BCBG21B BCBG21C
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    BCBG21A BCBG21B BCBG21C
        0 'No'
        1 'Yes'.
MISSING VALUES
    BCBG21A BCBG21B BCBG21C
        (-99).
RENAME VARIABLES (
    BCBG21A BCBG21B BCBG21C
    =
    PrLdrCer PrLdrMas PrLdrDoc
    ).

* Language of school questionnaire.
RECODE
    ITLANG_C
        (99=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ITLANG_C
        (-99).

* Locale ID of school questionnaire.
RECODE
    LCID_C
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    LCID_C
        (-99).

* TIMSS construct: School discipline-principal.
RECODE
    BCBGDAS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBGDAS
        (-99).
RENAME VARIABLES (
    BCBGDAS = SCLdiscp
    ).

* TIMSS construct: SEAS principal.
RECODE
    BCBGEAS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBGEAS
        (-99).
RENAME VARIABLES (
    BCBGEAS = CSCLseas
    ).

* TIMSS construct: Instruction affected by math resource shortage.
RECODE
    BCBGMRS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBGMRS
        (-99).
RENAME VARIABLES (
    BCBGMRS = SCLMRes
    ).

* TIMSS construct: Instruction affected by science resource shortage.
RECODE
    BCBGSRS
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCBGSRS
        (-99).
RENAME VARIABLES (
    BCBGSRS = SCLSRes
    ).

* TIMSS construct: School discipline-principal.
RECODE
    BCDGDAS
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCDGDAS
        (-99).
RENAME VARIABLES (
    BCDGDAS = IDXdiscp
    ).

* TIMSS construct: SEAS principal.
RECODE
    BCDGEAS
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCDGEAS
        (-99).
RENAME VARIABLES (
    BCDGEAS = CIDXseas
    ).

* TIMSS construct: Instruction affected by math resource shortage.
RECODE
    BCDGMRS
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCDGMRS
        (-99).
RENAME VARIABLES (
    BCDGMRS = IDXMRes
    ).

* TTIMSS construct: Instruction affected by science resource shortage.
RECODE
    BCDGSRS
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCDGSRS
        (-99).
RENAME VARIABLES (
    BCDGSRS = IDXSRes
    ).

* School Composition by socioeconomic background.
RECODE
    BCDGSBC
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCDGSBC
        (-99).
RENAME VARIABLES (
    BCDGSBC = SchSES
    ).

* Total Instructional Hours per Year.
RECODE
    BCDGTIHY
        (9999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    BCDGTIHY
        (-99).
RENAME VARIABLES (
    BCDGTIHY = InstHour
    ).

* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\5_TIMSS_2019_G8_S_clean\TIMSS_2019_G8_S_clean.sav".

***** End script *****
