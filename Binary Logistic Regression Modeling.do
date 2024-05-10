*Making Respose Numeric:
tab interestinpolitics

gen Interestinpolitics = 1 if interestinpolitics == "Not at all interested" 
replace Interestinpolitics = 2 if interestinpolitics == "Not very interested"
replace Interestinpolitics = 3 if interestinpolitics == "Somewhat interested"
replace Interestinpolitics = 4 if interestinpolitics == "Very interested"

tab Interestinpolitics

*** Making Response Binary:
replace Interestinpolitics = 0 if Interestinpolitics == 1| Interestinpolitics == 2
replace Interestinpolitics = 1 if Interestinpolitics == 3 | Interestinpolitics == 4

label define Interestinpolitics 0"Not interested" 1"Interested"
label values Interestinpolitics Interestinpolitics

tab Interestinpolitics

**National Pride Recoding:

tab nationalpride

gen Nationalpride = 1 if nationalpride == "Not at all proud" 
replace Nationalpride = 2 if nationalpride == "Not very proud"
replace Nationalpride = 3 if nationalpride == "Quite proud"
replace Nationalpride = 4 if nationalpride == "Very proud"


label define Nationalpride 1"Not at all proud" 2"Not very proud" 3"Quite proud" 4"Very proud"
label values Nationalpride Nationalpride
tab Nationalpride

****************************************************************
**Dummy Variables for the Education:
gen Educational_level_1 = 1 if Education == 1
replace Educational_level_1 = 0 if Education != 1

gen Educational_level_2 = 1 if Education == 2
replace Educational_level_2 = 0 if Education != 2

gen Educational_level_3 = 1 if Education == 3
replace Educational_level_3 = 0 if Education != 3

**Dummy Variables for Socialmedia:
gen Socialmedia_1 = 1 if Socialmedia == 1
replace Socialmedia_1 = 0 if Socialmedia != 1

gen Socialmedia_2 = 1 if Socialmedia == 2
replace Socialmedia_2 = 0 if Socialmedia != 2

gen Socialmedia_3 = 1 if Socialmedia == 3
replace Socialmedia_3 = 0 if Socialmedia != 3

gen Socialmedia_4 = 1 if Socialmedia == 4
replace Socialmedia_4 = 0 if Socialmedia != 4


***interaction term
gen edu_level_2_soc_level_2 = Educational_level_2 * Socialmedia_2
gen edu_level_2_soc_level_3 = Educational_level_2 * Socialmedia_3
gen edu_level_2_soc_level_4 = Educational_level_2 * Socialmedia_4

gen edu_level_3_soc_level_2 = Educational_level_3 * Socialmedia_2
gen edu_level_3_soc_level_3 = Educational_level_3 * Socialmedia_3
gen edu_level_3_soc_level_4 = Educational_level_3 * Socialmedia_4

************ Binary logistec regression***********
logit Interestinpolitics i.Satisfaction i.Democracy i.Education i.TVnews i.Socialmedia i.Nationalpride i.Talkwithfriends  edu_level_2_soc_level_2 - edu_level_3_soc_level_3, or

xi: stepwise, pr(0.05): logit Interestinpolitics i.Satisfaction i.Democracy i.Education i.TVnews i.Socialmedia i.Nationalpride i.Talkwithfriends edu_level_2_soc_level_2 edu_level_2_soc_level_3 edu_level_2_soc_level_4 edu_level_3_soc_level_2 edu_level_3_soc_level_3 edu_level_3_soc_level_4 , or

logit Interestinpolitics i.Education i.TVnews i.Socialmedia i.Talkwithfriends , or


estat gof
estat ic

estat classification
lsens
estat classification , cutoff (0.42)

lroc
fitstat

xi: collin i.Education i.TVnews i.Socialmedia i.Talkwithfriends
****************************************************************

**Ordinal Logistic Reg:

**Ordinal Variable Test: 

xi: stepwise, pr(0.05): ologit Interestinpolitics i.Satisfaction i.Democracy i.Education i.TVnews i.Socialmedia i.Nationalpride i.Talkwithfriends edu_level_2_soc_level_2 edu_level_2_soc_level_3 edu_level_3_soc_level_2 edu_level_3_soc_level_3, or

*First Creating Dummies:

**Dummy Variables for TVnews:
gen TVnews_1 = 1 if TVnews == 1
replace TVnews_1 = 0 if TVnews != 1

gen TVnews_2 = 1 if TVnews == 2
replace TVnews_2 = 0 if TVnews != 2

gen TVnews_3 = 1 if TVnews == 3
replace TVnews_3 = 0 if TVnews != 3

gen TVnews_4 = 1 if TVnews == 4
replace TVnews_4 = 0 if TVnews != 4

**Dummy Variables for Talkwithfriends:
gen Talkwithfriends_1 = 1 if Talkwithfriends == 1
replace Talkwithfriends_1 = 0 if Talkwithfriends != 1

gen Talkwithfriends_2 = 1 if Talkwithfriends == 2
replace Talkwithfriends_2 = 0 if Talkwithfriends != 2

gen Talkwithfriends_3 = 1 if Talkwithfriends == 3
replace Talkwithfriends_3 = 0 if Talkwithfriends != 3

gen Talkwithfriends_4 = 1 if Talkwithfriends == 4
replace Talkwithfriends_4 = 0 if Talkwithfriends != 4


**Dummy Variables for Satisfaction:
gen Satisfaction_1 = 1 if Satisfaction == 1
replace Satisfaction_1 = 0 if Satisfaction != 1

gen Satisfaction_2 = 1 if Satisfaction == 2
replace Satisfaction_2 = 0 if Satisfaction != 2

gen Satisfaction_3 = 1 if Satisfaction == 3
replace Satisfaction_3 = 0 if Satisfaction != 3


**Dummy Variables for Satisfaction:
gen Satisfaction_1 = 1 if Satisfaction == 1
replace Satisfaction_1 = 0 if Satisfaction != 1

gen Satisfaction_2 = 1 if Satisfaction == 2
replace Satisfaction_2 = 0 if Satisfaction != 2

gen Satisfaction_3 = 1 if Satisfaction == 3
replace Satisfaction_3 = 0 if Satisfaction != 3


**Dummy Variables for Democracy:
gen Democracy_1 = 1 if Democracy == 1
replace Democracy_1 = 0 if Democracy != 1

gen Democracy_2 = 1 if Democracy == 2
replace Democracy_2 = 0 if Democracy != 2

gen Democracy_3 = 1 if Democracy == 3
replace Democracy_3 = 0 if Democracy != 3


**Dummy Variables for TVnews:
gen Nationalpride_1 = 1 if Nationalpride == 1
replace Nationalpride_1 = 0 if Nationalpride != 1

gen Nationalpride_2 = 1 if Nationalpride == 2
replace Nationalpride_2 = 0 if Nationalpride != 2

gen Nationalpride_3 = 1 if Nationalpride == 3
replace Nationalpride_3 = 0 if Nationalpride != 3

gen Nationalpride_4 = 1 if Nationalpride == 4
replace Nationalpride_4 = 0 if Nationalpride != 4


** Ordinal Logistic Reg:

gen InterestinPolitics = 1 if interestinpolitics == "Not at all interested" 
replace InterestinPolitics = 2 if interestinpolitics == "Not very interested"
replace InterestinPolitics = 3 if interestinpolitics == "Somewhat interested"
replace InterestinPolitics = 4 if interestinpolitics == "Very interested"

label define InterestinPolitics 1"Not at all interested" 2"Not very Interested" 3"Somewhat interested" 4"Very interested"
label values InterestinPolitics InterestinPolitics

tab InterestinPolitics

omodel logit InterestinPolitics TVnews_2 TVnews_3 TVnews_4 Talkwithfriends_2 Talkwithfriends_3 Talkwithfriends_4 Satisfaction_2 Satisfaction_3 Democracy_2 Democracy_3 Nationalpride_2 Nationalpride_3 Nationalpride_4 Socialmedia_2 Socialmedia_3 Socialmedia_4 Educational_level_2 Educational_level_3 edu_level_2_soc_level_2 edu_level_2_soc_level_3 edu_level_2_soc_level_4 edu_level_3_soc_level_2 edu_level_3_soc_level_3 edu_level_3_soc_level_4 

ologit Corruption_level i.sex i.Confidence_The_Press i.Confidence_The_Government i.Corruption_State_authorities i.Age, or


****Multinomial Logistic Regression:

mlogit InterestinPolitics i.Satisfaction i.Democracy i.Education i.TVnews i.Socialmedia i.Nationalpride i.Talkwithfriends edu_level_2_soc_level_2 edu_level_2_soc_level_3 edu_level_2_soc_level_4 edu_level_3_soc_level_2 edu_level_3_soc_level_3 edu_level_3_soc_level_4  , rrr

mlogitgof 
