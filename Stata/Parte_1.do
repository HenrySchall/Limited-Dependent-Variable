
************************************
** Uso dos Modelos Logit & Probit **
************************************

tab winner

     winner |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        486       63.95       63.95
          1 |        274       36.05      100.00
------------+-----------------------------------
      Total |        760      100.00

reg winner red home goals, robust

Linear regression                               Number of obs     =        760
                                                F(3, 756)         =     360.61
                                                Prob > F          =     0.0000
                                                R-squared         =     0.4496
                                                Root MSE          =     .35716

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.0918241   .0291544    -3.15   0.002    -.1490573   -.0345909
        home |   .1084483   .0272263     3.98   0.000     .0550001    .1618965
       goals |    .271496   .0095607    28.40   0.000     .2527274    .2902647
       _cons |  -.0158428   .0171947    -0.92   0.357    -.0495978    .0179123
------------------------------------------------------------------------------


logit winner red home goals, robust

Iteration 0:   log pseudolikelihood = -496.82752  
Iteration 1:   log pseudolikelihood = -291.81545  
Iteration 2:   log pseudolikelihood = -286.05604  
Iteration 3:   log pseudolikelihood = -285.92826  
Iteration 4:   log pseudolikelihood = -285.92815  
Iteration 5:   log pseudolikelihood = -285.92815  

Logistic regression                                     Number of obs =    760
                                                        Wald chi2(3)  = 233.35
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -285.92815                       Pseudo R2     = 0.4245

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.8724907   .3356889    -2.60   0.009    -1.530429   -.2145525
        home |   .8294697   .2158113     3.84   0.000     .4064873    1.252452
       goals |   1.977419   .1317121    15.01   0.000     1.719268     2.23557
       _cons |  -3.598045   .2357149   -15.26   0.000    -4.060038   -3.136052
------------------------------------------------------------------------------

probit winner red home goals, robust

Iteration 0:   log pseudolikelihood = -496.82752  
Iteration 1:   log pseudolikelihood = -285.57146  
Iteration 2:   log pseudolikelihood = -283.42747  
Iteration 3:   log pseudolikelihood = -283.40984  
Iteration 4:   log pseudolikelihood = -283.40983  

Probit regression                                       Number of obs =    760
                                                        Wald chi2(3)  = 275.20
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -283.40983                       Pseudo R2     = 0.4296

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.4843821   .1802604    -2.69   0.007     -.837686   -.1310783
        home |   .4703177   .1198033     3.93   0.000     .2355074    .7051279
       goals |   1.155693   .0714303    16.18   0.000     1.015692    1.295693
       _cons |  -2.111282   .1250664   -16.88   0.000    -2.356408   -1.866157
------------------------------------------------------------------------------

* Comentários:
* Segundo modelo é um pouquinho melhor, porque possui um menor pesudo R2
* Para comparar um coeficente com outro eu calculo o efeito marginal em cada modelo

* Calcular Grau de ajuste do modelo
estat classification

Probit model for winner

              -------- True --------
Classified |         D            ~D  |      Total
-----------+--------------------------+-----------
     +     |       199            60  |        259
     -     |        75           426  |        501
-----------+--------------------------+-----------
   Total   |       274           486  |        760

Classified + if predicted Pr(D) >= .5
True D defined as winner != 0
--------------------------------------------------
Sensitivity                     Pr( +| D)   72.63%
Specificity                     Pr( -|~D)   87.65%
Positive predictive value       Pr( D| +)   76.83%
Negative predictive value       Pr(~D| -)   85.03%
--------------------------------------------------
False + rate for true ~D        Pr( +|~D)   12.35%
False - rate for true D         Pr( -| D)   27.37%
False + rate for classified +   Pr(~D| +)   23.17%
False - rate for classified -   Pr( D| -)   14.97%
--------------------------------------------------
Correctly classified                        82.24%
--------------------------------------------------

/* A probalbilidade de você encontrar sua amostra cresce em torno de 43% na função de Verossimilhança, quando
o seu modelo com as três variáveis explicativas é comparado com o modelo, que apresenta apenas o beta0 */

*82% é a qualidade do ajuste

Conditional marginal effects                               Number of obs = 760
Model VCE: Robust

Expression: Pr(winner), predict()
dy/dx wrt:  home
At: red   = .1486842 (mean)
    home  =       .5 (mean)
    goals = 1.236842 (mean)

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
        home |     .16401   .0419252     3.91   0.000      .081838    .2461819
------------------------------------------------------------------------------

margins, dydx(home)

Average marginal effects                                   Number of obs = 760
Model VCE: Robust

Expression: Pr(winner), predict()
dy/dx wrt:  home

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
        home |   .0966214   .0238599     4.05   0.000     .0498568     .143386
------------------------------------------------------------------------------

* Comentários:
* com atmean = efeito parcial na média (PEA)
* sem atmean = efeito parcial médio (APE)
* não podemos comparar os resultados entre os modelos Logit e Probit com o Modelo Linear, precisamos comprarar os efeitos marginais entre eles


* Calcular efeitos marginais de todo os modelos

* Efeitos Marginais Probit
probit winner red home goals, robust

Iteration 0:   log pseudolikelihood = -496.82752  
Iteration 1:   log pseudolikelihood = -285.57146  
Iteration 2:   log pseudolikelihood = -283.42747  
Iteration 3:   log pseudolikelihood = -283.40984  
Iteration 4:   log pseudolikelihood = -283.40983  

Probit regression                                       Number of obs =    760
                                                        Wald chi2(3)  = 275.20
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -283.40983                       Pseudo R2     = 0.4296

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.4843821   .1802604    -2.69   0.007     -.837686   -.1310783
        home |   .4703177   .1198033     3.93   0.000     .2355074    .7051279
       goals |   1.155693   .0714303    16.18   0.000     1.015692    1.295693
       _cons |  -2.111282   .1250664   -16.88   0.000    -2.356408   -1.866157
------------------------------------------------------------------------------

margins, dydx(*) 

Average marginal effects                                   Number of obs = 760
Model VCE: Robust

Expression: Pr(winner), predict()
dy/dx wrt:  red home goals

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.0995108   .0364165    -2.73   0.006    -.1708857   -.0281358
        home |   .0966214   .0238599     4.05   0.000     .0498568     .143386
       goals |   .2374238   .0072938    32.55   0.000     .2231283    .2517194
------------------------------------------------------------------------------

* Efeitos Marginais Logit
logit winner red home goals, robust

Iteration 0:   log pseudolikelihood = -496.82752  
Iteration 1:   log pseudolikelihood = -291.81545  
Iteration 2:   log pseudolikelihood = -286.05604  
Iteration 3:   log pseudolikelihood = -285.92826  
Iteration 4:   log pseudolikelihood = -285.92815  
Iteration 5:   log pseudolikelihood = -285.92815  

Logistic regression                                     Number of obs =    760
                                                        Wald chi2(3)  = 233.35
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -285.92815                       Pseudo R2     = 0.4245

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.8724907   .3356889    -2.60   0.009    -1.530429   -.2145525
        home |   .8294697   .2158113     3.84   0.000     .4064873    1.252452
       goals |   1.977419   .1317121    15.01   0.000     1.719268     2.23557
       _cons |  -3.598045   .2357149   -15.26   0.000    -4.060038   -3.136052
------------------------------------------------------------------------------

margins, dydx(*)

Average marginal effects                                   Number of obs = 760
Model VCE: Robust

Expression: Pr(winner), predict()
dy/dx wrt:  red home goals

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.1035843   .0390379    -2.65   0.008    -.1800971   -.0270714
        home |   .0984767   .0248277     3.97   0.000     .0498153    .1471381
       goals |    .234764   .0072255    32.49   0.000     .2206024    .2489257
------------------------------------------------------------------------------

* Efeitos Marginais Regressão Linear
reg winner red home goals, robust

Linear regression                               Number of obs     =        760
                                                F(3, 756)         =     360.61
                                                Prob > F          =     0.0000
                                                R-squared         =     0.4496
                                                Root MSE          =     .35716

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.0918241   .0291544    -3.15   0.002    -.1490573   -.0345909
        home |   .1084483   .0272263     3.98   0.000     .0550001    .1618965
       goals |    .271496   .0095607    28.40   0.000     .2527274    .2902647
       _cons |  -.0158428   .0171947    -0.92   0.357    -.0495978    .0179123
------------------------------------------------------------------------------

margins, dydx(*)

Average marginal effects                                   Number of obs = 760
Model VCE: Robust

Expression: Linear prediction, predict()
dy/dx wrt:  red home goals

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.0918241   .0291544    -3.15   0.002    -.1490573   -.0345909
        home |   .1084483   .0272263     3.98   0.000     .0550001    .1618965
       goals |    .271496   .0095607    28.40   0.000     .2527274    .2902647
------------------------------------------------------------------------------


* Fazendo Previsão 

* Previsão Linear
reg winner red home goals, robust

Linear regression                               Number of obs     =        760
                                                F(3, 756)         =     360.61
                                                Prob > F          =     0.0000
                                                R-squared         =     0.4496
                                                Root MSE          =     .35716

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.0918241   .0291544    -3.15   0.002    -.1490573   -.0345909
        home |   .1084483   .0272263     3.98   0.000     .0550001    .1618965
       goals |    .271496   .0095607    28.40   0.000     .2527274    .2902647
       _cons |  -.0158428   .0171947    -0.92   0.357    -.0495978    .0179123
------------------------------------------------------------------------------
predict p_mqo
(option xb assumed; fitted values)

* Previsão Logit
logit winner red home goals, robust

Iteration 0:   log pseudolikelihood = -496.82752  
Iteration 1:   log pseudolikelihood = -291.81545  
Iteration 2:   log pseudolikelihood = -286.05604  
Iteration 3:   log pseudolikelihood = -285.92826  
Iteration 4:   log pseudolikelihood = -285.92815  
Iteration 5:   log pseudolikelihood = -285.92815  

Logistic regression                                     Number of obs =    760
                                                        Wald chi2(3)  = 233.35
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -285.92815                       Pseudo R2     = 0.4245

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.8724907   .3356889    -2.60   0.009    -1.530429   -.2145525
        home |   .8294697   .2158113     3.84   0.000     .4064873    1.252452
       goals |   1.977419   .1317121    15.01   0.000     1.719268     2.23557
       _cons |  -3.598045   .2357149   -15.26   0.000    -4.060038   -3.136052
------------------------------------------------------------------------------

predict p_logit
(option pr assumed; Pr(winner))

* Previsão Probit
probit winner red home goals, robust

Iteration 0:   log pseudolikelihood = -496.82752  
Iteration 1:   log pseudolikelihood = -285.57146  
Iteration 2:   log pseudolikelihood = -283.42747  
Iteration 3:   log pseudolikelihood = -283.40984  
Iteration 4:   log pseudolikelihood = -283.40983  

Probit regression                                       Number of obs =    760
                                                        Wald chi2(3)  = 275.20
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -283.40983                       Pseudo R2     = 0.4296

------------------------------------------------------------------------------
             |               Robust
      winner | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         red |  -.4843821   .1802604    -2.69   0.007     -.837686   -.1310783
        home |   .4703177   .1198033     3.93   0.000     .2355074    .7051279
       goals |   1.155693   .0714303    16.18   0.000     1.015692    1.295693
       _cons |  -2.111282   .1250664   -16.88   0.000    -2.356408   -1.866157
------------------------------------------------------------------------------

predict p_probit
(option pr assumed; Pr(winner))

* Resumo dos modelos
sum p_mqo p_logit p_probit

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       p_mqo |        760    .3605263    .3221637  -.1994909   1.721582
     p_logit |        760    .3605263    .3346221   .0047586   .9998879
    p_probit |        760    .3571122     .334946   .0010348   .9999999


scatter p_mqo winner
scatter p_logit winner
