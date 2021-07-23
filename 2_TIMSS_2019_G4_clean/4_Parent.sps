* Encoding: UTF-8.

**** ADMIN INFO *****
* Date: 21 July 2021
* Author: Tony Tan
* Email: tctan@uio.no
* Position: Research Assistant
* Organisation: CEMO, UV, UiO
* Script purpose: Data cleaning--Parent

***** DATA ATTRIBUTES *****
* ILSA: TIMSS
* Cycle: 2019
* Questionnaire: Parent
* Grade: Grade 4
* Subject: Math and Science

***** Begin script *****

* Import data.
GET FILE =
    "D:\TIMSS_2019\2_TIMSS_2019_G4_clean\TIMSS_2019_G4_clean.sav".

**************************
** Parent variables **
**************************

* 1: Students activities before they began primary school.
RECODE
    ASBH01A ASBH01B ASBH01C ASBH01D ASBH01E ASBH01F
    ASBH01G ASBH01H ASBH01I ASBH01J ASBH01K ASBH01L
    ASBH01M ASBH01N ASBH01O ASBH01P ASBH01Q ASBH01R
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH01A ASBH01B ASBH01C ASBH01D ASBH01E ASBH01F
    ASBH01G ASBH01H ASBH01I ASBH01J ASBH01K ASBH01L
    ASBH01M ASBH01N ASBH01O ASBH01P ASBH01Q ASBH01R
        0 'Never or almost never'
        1 'Sometimes'
        2 'Often'.
MISSING VALUES
    ASBH01A ASBH01B ASBH01C ASBH01D ASBH01E ASBH01F
    ASBH01G ASBH01H ASBH01I ASBH01J ASBH01K ASBH01L
    ASBH01M ASBH01N ASBH01O ASBH01P ASBH01Q ASBH01R
        (-99).
RENAME VARIABLES (
    ASBH01A ASBH01B ASBH01C ASBH01D ASBH01E ASBH01F
    ASBH01G ASBH01H ASBH01I ASBH01J ASBH01K ASBH01L
    ASBH01M ASBH01N ASBH01O ASBH01P ASBH01Q ASBH01R
    =
    PReadBok PTelStry Psing Palphbt Ptalk PBokDis
    PWrdGame PWrtLet PReadSgn PCntSg PNumToy PCntThg
    PGameSh PBlock PBoard PWrtNum PDrawSh Pweight
    ).

* 2A: Children born in the country.
RECODE
    ASBH02A
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH02A
        0 'No'
        1 'Yes'.
MISSING VALUES
    ASBH02A
        (-99).
RENAME VARIABLES (
    ASBH02A = ChBorn
    ).

* 2B: Children age when they came to the country.
RECODE
    ASBH02B
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBH02B
        (-99).
RENAME VARIABLES (
    ASBH02B = ChAgeCnt
    ).

* 3: Languages students speak.
RECODE
    ASBH04AA ASBH04AB
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH04AA ASBH04AB
        0 'No'
        1 'Yes'.
MISSING VALUES
    ASBH04AA ASBH04AB
        (-99).
RENAME VARIABLES (
    ASBH04AA ASBH04AB
    =
    EarlyChEd PrePriEd
    ).

* 4A: Attending early childhood education.
RECODE
    ASBH03A ASBH03B ASBH03C ASBH03D ASBH03E ASBH03F 
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH03A ASBH03B ASBH03C ASBH03D ASBH03E ASBH03F
        0 'No'
        1 'Yes'.
MISSING VALUES
    ASBH03A ASBH03B ASBH03C ASBH03D ASBH03E ASBH03F
        (-99).
RENAME VARIABLES (
    ASBH03A ASBH03B ASBH03C ASBH03D ASBH03E ASBH03F
    =
    TestLang MulLang1 MulLang2 MulLang3 MulLang4 MulLang5
    ).

* 4B: Number of years attending early childhood and preprimary education.
RECODE
    ASBH04B 
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH04B
        0 'Did not attend'
        1 'Less than 1 year'
        2 '1 year'
        3 '2 years'
        4 '3 years'
        5 '4 years or more'.
MISSING VALUES
    ASBH04B
        (-99).
RENAME VARIABLES (
    ASBH04B = ProgDur
    ).


* 5: Age of child began primary school.
RECODE
    ASBH05 
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH05
        0 '5 years old or younger'
        1 '6 years old'
        2 '7 years old'
        3 '8 years old or older'.
MISSING VALUES
    ASBH05
        (-99).
RENAME VARIABLES (
    ASBH05 = AgeSch
    ).

* 6: Reading skills the child master before began primary school.
RECODE
    ASBH06A ASBH06B ASBH06C ASBH06D ASBH06E ASBH06F ASBH06G
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH06A ASBH06B ASBH06C ASBH06D ASBH06E ASBH06F ASBH06G
        0 'Not at all'
        1 'Not very well'
        2 'Moderately well'
        3 'Very well'.
MISSING VALUES
    ASBH06A ASBH06B ASBH06C ASBH06D ASBH06E ASBH06F ASBH06G
        (-99).
RENAME VARIABLES (
    ASBH06A ASBH06B ASBH06C ASBH06D ASBH06E ASBH06F ASBH06G
    =
    SKLetter SKWord SKSentc SKStory SKWrtLet SKWrtNam SKWrtWrd
    ).

* 7 A,B,C: Reading skills the child master before began primary school.
RECODE
    ASBH07A ASBH07B ASBH07C
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH07A ASBH07B ASBH07C
        0 'Not at all'
        1 'Up to 10'
        2 'Up to 20'
        3 'Up to 100 or higher'.
MISSING VALUES
    ASBH07A ASBH07B ASBH07C
        (-99).
RENAME VARIABLES (
    ASBH07A ASBH07B ASBH07C
    =
    SKCount SKNum SKWrtNum
    ).

* 7 D,E: Reading skills the child master before began primary school.
RECODE
    ASBH07D ASBH07E
        (1=1) (2=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH07D ASBH07E
        0 'No'
        1 'Yes'.
MISSING VALUES
    ASBH07D ASBH07E
        (-99).
RENAME VARIABLES (
    ASBH07D ASBH07E
    =
    SKAddict SKSubtrc
    ).

* 8A: Studying outside of school.
RECODE
    ASBH08AA ASBH08AB
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH08AA ASBH08AB
        0 'No'
        1 'Yes, to keep up in class'
        2 'Yes, to excel in class'.
MISSING VALUES
    ASBH08AA ASBH08AB
        (-99).
RENAME VARIABLES (
    ASBH08AA ASBH08AB
    =
    XtraMLes XtraSLes
    ).

* 8B: Studying outside of school.
RECODE
    ASBH08BA ASBH08BB
        (1=0) (2=1) (3=2) (4=3)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH08BA ASBH08BB
        0 'Did not attend'
        1 'Less than 4 months'
        2 '4-8 months'
        3 'More than 8 months'.
MISSING VALUES
    ASBH08BA ASBH08BB
        (-99).
RENAME VARIABLES (
    ASBH08BA ASBH08BB
    =
    XtraMHr XtraSHr
    ).

* 9: Parents' opinion on school.
RECODE
    ASBH09A ASBH09B ASBH09C ASBH09D
    ASBH09E ASBH09F ASBH09G ASBH09H
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH09A ASBH09B ASBH09C ASBH09D
    ASBH09E ASBH09F ASBH09G ASBH09H
        0 'Disagree a lot'
        1 'Disagree a little'
        2 'Agree a little'
        3 'Agree a lot'.
MISSING VALUES
    ASBH09A ASBH09B ASBH09C ASBH09D
    ASBH09E ASBH09F ASBH09G ASBH09H
        (-99).
RENAME VARIABLES (
    ASBH09A ASBH09B ASBH09C ASBH09D
    ASBH09E ASBH09F ASBH09G ASBH09H
    =
    ScInclud ScSafeEn ScProgram ScInform
    ScHighSt ScReadBt ScMathBt ScSciBt 
    ).

* 10: Number of books at home according to parent.
RECODE
    ASBH10
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH10
        0 '0 - 10'
        1 '11 - 25'
        2 '26 - 100'
        3 '101 - 200'
        4 'More than 200'.
MISSING VALUES
    ASBH10
        (-99).
RENAME VARIABLES (
    ASBH10 = BookHome 
    ).

* 11: Number of books for children at home.
RECODE
    ASBH11
        (1=0) (2=1) (3=2) (4=3) (5=4)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH11
        0 '0--10'
        1 '11--25'
        2 '26--100'
        3 '101--200'
        4 'More than 200'.
MISSING VALUES
    ASBH11
        (-99).
RENAME VARIABLES (
    ASBH11 = BookChild 
    ).

* 12: Parents' country of birth.
RECODE
    ASBH12A ASBH12B
        (1=0) (2=1) (3=2)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH12A ASBH12B
        0 'Yes'
        1 'No'
        2 'Not applicable'.
MISSING VALUES
    ASBH12A ASBH12B
        (-99).
RENAME VARIABLES (
    ASBH12A ASBH12B 
    = 
    PFaBorn PMoBorn
    ).

* 13: Languages that parents use to communicate with the child.
RECODE
    ASBH13AA ASBH13AB ASBH13BA ASBH13BB ASBH13CA ASBH13CB ASBH13DA
    ASBH13DB ASBH13EA ASBH13EB ASBH13FA ASBH13FB ASBH13GA ASBH13GB 
        (1=0) (2=1) (6=2)
        (6=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH13AA ASBH13AB ASBH13BA ASBH13BB ASBH13CA ASBH13CB ASBH13DA
    ASBH13DB ASBH13EA ASBH13EB ASBH13FA ASBH13FB ASBH13GA ASBH13GB 
         0 ''
        1 ''
        2 ''.
MISSING VALUES
    ASBH13AA ASBH13AB ASBH13BA ASBH13BB ASBH13CA ASBH13CB ASBH13DA
    ASBH13DB ASBH13EA ASBH13EB ASBH13FA ASBH13FB ASBH13GA ASBH13GB 
        (-99).
RENAME VARIABLES (
    ASBH13AA ASBH13AB ASBH13BA ASBH13BB ASBH13CA ASBH13CB ASBH13DA
    ASBH13DB ASBH13EA ASBH13EB ASBH13FA ASBH13FB ASBH13GA ASBH13GB  
    = 
    PFaLang PMoLang PFaLang1 PMoLang1 PFaLang2 PMoLang2 PFaLang3
    PMoLang3 PFaLang4 PMoLang4 PFaLang5 PMoLang5 FaNoApp MoNoAp 
    ).

* 14: The use of language of the test at home.
RECODE
    ASBH14
        (1=3) (2=2) (3=1) (4=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH14 
        0 'Never'
        1 'Sometimes'
        2 'Almost always'
        3 'Always'.
MISSING VALUES
    ASBH14 
        (-99).
RENAME VARIABLES (
    ASBH14 
    = 
    LangHome 
    ).

* 15: Parental education.
RECODE
    ASBH15A ASBH15B
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=7) (9=8)
        (99=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH15A ASBH15B 
        0 'Did not go to school'
        1 'Some <Primary education-- ISCED Level1 or Lower secondary education--ISCED Level 2>'
        2 '<Lower secondary education ISCED Level 2>'
        3 '<Upper secondary education-- ISCED Level 3>'
        4 '<Post-secondary, non-tertiary education-- ISCED Level 4>'
        5 '<Short-cycle tertiary education-- ISCED Level 5>'
        6 '<Bachelors or equivalent level--ISCED Level 6>'
        7 '<Postgraduate degree: Masters--ISCED Level 7 or Doctor--ISCED Level 8>'
        8 'Not applicable'.
MISSING VALUES
    ASBH15A ASBH15B 
        (-99).
RENAME VARIABLES (
    ASBH15A ASBH15B 
    = 
    FaEdu MoEdu 
    ).

* 16: Parent's expectation of the child education.
RECODE
    ASBH16
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH16 
        0 'Finish <Lower secondary education--ISCED Level 2>'
        1 'Finish <Upper secondary education-- ISCED Level 3>'
        2 'Finish <Post-secondary, non-tertiary education-- ISCED Level 4>'
        3 'Finish <Short-cycle tertiary education-- ISCED Level 5>'
        4 'Finish <Bachelors or equivalent level--ISCED Level 6>'
        5 'Finish <Postgraduate degree: Masters--ISCED Level 7 or Doctor--ISCED Level 8>'.
MISSING VALUES
    ASBH16 
        (-99).
RENAME VARIABLES (
    ASBH16 = ChEduExp 
    ).

* 17: Parental occupation.
RECODE
    ASBH17A ASBH17B
        (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6)
        (8=7) (9=8) (10=9) (11=10) (12=11)
        (99=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASBH17A ASBH17B 
        0 'Has never worked for pay'
        1 'Small Business Owner'
        2 'Clerical Worker'
        3 'Service or Sales Worker'
        4 'Skilled Agricultural or Fishery Worker'
        5 'Craft or Trade worker'
        6 'Plant or Machine Operator'
        7 'General Laborers'
        8 'Corporate Manager or Senior Official'
        9 'Professional'
        10 'Technician or Associate Professional'
        11 'Not applicable'.
MISSING VALUES
    ASBH17A ASBH17B 
        (-99).
RENAME VARIABLES (
    ASBH17A ASBH17B 
    = 
    FaJob MoJob
    ).

**************************
** Compound Variables **
**************************

* Language of home questionnaire.
RECODE
    ITLANG_SH
        (9999999999=-99) (SYSMIS=-99) (MISSING=-99).

MISSING VALUES
    ITLANG_SH 
        (-99).

* Locale ID of student home questionnaire.
RECODE
    LCID_SH
        (99=-99) (SYSMIS=-99) (MISSING=-99).

MISSING VALUES
    LCID_SH 
        (-99).

* TIMSS construct: Early literacy activities before school.
RECODE
    ASBHELA
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHELA
        (-99).
RENAME VARIABLES (
    ASBHELA = SCLLitcy
    ).

* TIMSS construct: Early literacy activities before school.
RECODE
    ASDHELA
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHELA
        0 'Never or almost never'
        1 'Sometimes'
        2 'Often'.
MISSING VALUES
    ASDHELA
        (-99).
RENAME VARIABLES (
    ASDHELA = IDXLitcy
    ).

* TIMSS construct: Early numeracy activities before school.
RECODE
    ASBHENA
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHENA
        (-99).
RENAME VARIABLES (
    ASBHENA = SCLNumcy
    ).

* TIMSS construct: EarEarly numeracy activities before school.
RECODE
    ASDHENA
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHENA
        0 'Never or almost never'
        1 'Sometimes'
        2 'Often'.
MISSING VALUES
    ASDHENA
        (-99).
RENAME VARIABLES (
    ASDHENA = IDXNumcy
    ).

* TIMSS construct: Early literacy and numeracy activities before school.
RECODE
    ASBHELN
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHELN
        (-99).
RENAME VARIABLES (
    ASBHELN = SCLLitNum
    ).

* TIMSS construct: Early literacy and numeracy activities before school.
RECODE
    ASDHELN
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHELN
        0 'Never or almost never'
        1 'Sometimes'
        2 'Often'.
MISSING VALUES
    ASDHELN
        (-99).
RENAME VARIABLES (
    ASDHELN = IDXLitNum
    ).

* TIMSS construct: Early literacy tasks beginning school.
RECODE
    ASBHELT
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHELT
        (-99).
RENAME VARIABLES (
    ASBHELT = SCLLitTsk
    ).

* TIMSS construct: Early literacy tasks beginning school.
RECODE
    ASDHELT
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHELT
        0 'Not well'
        1 'Moderately well'
        2 'Very well'.
MISSING VALUES
    ASDHELT
        (-99).
RENAME VARIABLES (
    ASDHELT = IDXLitTsk
    ).

* TIMSS construct: Early numeracy tasks beginning school.
RECODE
    ASBHENT
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHENT
        (-99).
RENAME VARIABLES (
    ASBHENT = SCLNumTsk
    ).

* TIMSS construct: Early numeracy tasks beginning school.
RECODE
    ASDHENT
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHENT
        0 'Not well'
        1 'Moderately well'
        2 'Very well'.
MISSING VALUES
    ASDHENT
        (-99).
RENAME VARIABLES (
    ASDHENT = IDXNumTsk
    ).

* TIMSS construct: Early literacy and numeracy tasks beginning school.
RECODE
    ASBHLNT
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHLNT
        (-99).
RENAME VARIABLES (
    ASBHLNT = SCLTask
    ).

* TIMSS construct: Early literacy and numeracy tasks beginning school.
RECODE
    ASDHLNT
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHLNT
        0 'Not well'
        1 'Moderately well'
        2 'Very well'.
MISSING VALUES
    ASDHLNT
        (-99).
RENAME VARIABLES (
    ASDHLNT = IDXTask
    ).

* TIMSS construct: Parents perceptions of their child school.
RECODE
    ASBHPSP
        (999999=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASBHPSP
        (-99).
RENAME VARIABLES (
    ASBHPSP = SCLPerSc
    ).

* TIMSS construct: Parents perceptions of their child school.
RECODE
    ASDHPSP
        (1=2) (2=1) (3=0)
        (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHPSP
        0 'Less than Satisfied'
        1 'Somewhat Satisfied'
        2 'Very Satisfied'.
MISSING VALUES
    ASDHPSP
        (-99).
RENAME VARIABLES (
    ASDHPSP = IDXPerSc
    ).

* Highest parental occupation level.
RECODE
    ASDHOCCP
        (1=5) (2=4) (3=3) (4=2) (5=1) (6=0)
        (7=-99) (9=-99) (SYSMIS=-99) (MISSING=-99).
VALUE LABELS
    ASDHOCCP
        0 'Never Worked for Pay'
        1 'General Laborer'
        2 'Skilled Worker'
        3 'Clerical'
        4 'Small Business Owner'
        5 'Professional'
        6 'Not applicable'.
MISSING VALUES
    ASDHOCCP
        (-99).
RENAME VARIABLES (
    ASDHOCCP = ParJob
    ).

* Highest parental education level.
RECODE
    ASDHEDUP
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASDHEDUP
        (-99).
RENAME VARIABLES (
    ASDHEDUP = ParEdu
    ).

* Student Attended Preschool.
RECODE
    ASDHAPS
        (9=-99) (SYSMIS=-99) (MISSING=-99).
MISSING VALUES
    ASDHAPS
        (-99).
RENAME VARIABLES (
    ASDHAPS = Preschl
    ).

* Run script.
EXECUTE.

* Update data set.
SAVE OUTFILE =
    "D:\TIMSS_2019\2_TIMSS_2019_G4_clean\TIMSS_2019_G4_clean.sav".

***** End script *****

