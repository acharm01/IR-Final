tab war
tab mid

logit war contig terrdisp rivalry armsrace 
estat summarize 
outreg2 using IR.doc, replace dec(3) 
***logit cannot be used like coefficients in OLS/ but z score and p-values can be used/similarly can look at the direction***
***effects of contiguity and rivalry are negative***
***z-scores: Highest for territorial dispute, so it's effect is more significant***
***Then, effect of arms race significant***
***effect of contiguity least significant***
***rivalry second from the last***
***p values for all IVs except rivalry are less than 0.05. That is, effect is significant for all variables except rivalry significant***

logit mid contig terrdisp rivalry armsrace
estat summarize
outreg2 using IR.doc, append dec(3)  
***z scores--effect of territorial disputes the most significant***
***effects of rivalry and armsrace almost equally significant in MID initiation/different results from war onset***
***p-values significant for all except contiguity...but contiguity still has negative effect on MID initiation***

***change in probability***
quietly logit war contig terrdisp rivalry armsrace
margins, dydx(*) atmeans
***one-step up on the territorial disputes, increases the probability of war by almost 4 percent***
***one-step up on the contiguity, decreases the probability of war by 4.2 percent***
***one-step up on the rivalry, decreases the probability of war by 1.4 percent***
***one-step up on the arms race, increases the probability of war by 2.3 percent***
marginsplot 


quietly logit mid contig terrdisp rivalry armsrace
margins, dydx(*) atmeans
***one-step up on territorial disputes,rivalry and arms race, increases probability of MID by 4.8 percent,7.4 percent and 5.5 percent***
***one step up on contiguity,decreases probability of MID by almost 1 percent***
marginsplot

***conditional***
***Contiguity and territorial disputes***

logit war i.contig##i.terrdisp rivalry armsrace
outreg2 using interactionIR.doc, replace dec(3) 
quietly logit war i.contig##i.terrdisp rivalry armsrace
margins, at(contig= (0 1) terrdisp= (0 1))
marginsplot 

logit mid i.contig##i.terrdisp rivalry armsrace
outreg2 using interactionIR.doc, append dec(3) 
quietly logit war i.contig##i.terrdisp rivalry armsrace
margins, at(contig= (0 1) terrdisp= (0 1))
marginsplot

***Contiguity and rivalry***

logit war i.contig##i.rivalry terrdisp armsrace
outreg2 using interactionIR1.doc, replace dec(3)
***Direction positive but not significant p value***
quietly logit war i.contig##i.rivalry terrdisp armsrace
margins, at(contig= (0 1)rivalry= (0 1))
marginsplot

logit mid i.contig##i.rivalry terrdisp armsrace
outreg2 using interactionIR1.doc, append dec(3)
***Direction positive but not significant p value***
 

***Contiguity and Arms Race***

logit war i.contig##i.armsrace terrdisp rivalry
outreg2 using interactionIR2.doc, replace dec(3)
***Direction negative but not significant p value***
quietly logit war i.contig##i.armsrace terrdisp rivalry
margins, at(contig= (0 1)armsrace= (0 1))
marginsplot

logit mid i.contig##i.armsrace terrdisp rivalry
outreg2 using interactionIR2.doc, append dec(3)

***check if this data fits the model***
quietly logit war contig terrdisp rivalry armsrace 
linktest, nolog

***This shows that the model we choose is correctly specified as _hatsq is not significant***
***p value is 0.114 which is > than 0.05***

quietly logit war contig terrdisp rivalry armsrace 
estat gof 

***The model fits reasonably well as the value of p > 0.05. The significant value would have meant that we have to reject the model. ***
***p value is 0.1137***


***Check for multicollinearity***
quietly regress war contig terrdisp rivalry armsrace 
estat vif

***The Variance Inflation Factor(VIF) is less than 5 for each IV, so I conclude that there is no problem with multicollinearity as well***



