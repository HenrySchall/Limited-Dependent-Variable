# Modelos Probabilísticos ou Escolha Qualitativa

> Os modelos de escolha qualitativa, também conhecidos como modelos de escolha discreta ou probabilísticos, são usados para modelar decisões em que indivíduos ou entidades escolhem entre um conjunto finito de alternativas, ou seja, temos
uma variável dependente categórica (Y = 1 ou 0). Ao contrário de outros modelos, nesse caso o objetivo é encontrar a probabilidaddde da ocorrência da variável dependente, ou seja, do evento binário.

### Tipos de Modelos 
1) Logit
2) Probit 
3) Logit Ordenado
4) Probit Ordenado
5) Logit Condicional
6) Logit Misto

### 1) Logit (Regressão Logística)

### Equação Geral 
$log(\frac{p}{1-p}) = \beta0 + \beta1X$

- P representa a probabilidade positiva (Exemplo: passar no teste de motorista)
- P / (1-P) representa a probabilidade de passar no teste em relação à probabilidade de não teste no exame
- 0 log(P / (1-P)) representa o log-odds (logaritmo da razão de chances) de passar no teste
- X representa um variável explicativa (Exemplo: tempo de estudo)
- β0 é o intercepto
- β1 é o coeficiente associado a variável explicativa. Este coeficiente nos diz o quanto o tempo de estudo influencia o resultado (passar ou não no teste).

> Todavia nessa equação estamos mensurando a variação do logit estimado, ou seja, a variação da variável dependente Y, para uma variação unitária da variável explicativa escolhida. Pensando na obtenção de resultados mais conclusivos que gerem valor para nosso estudo, o correto seria obtermos as probabilidades de ocorrência do evento, ou seja, precisamos encontrar uma forma de converter os log-odds (chances) em probabilidades, porque queremos que as probabilidades previstas estejam entre 0 e 1 (evento binário). A parti de agora pasamos a adotar uma reta/função de regressão diferente da convencional, como a utilizada por exemplo em regressão linear simples, no caso dos modelos probabilísticos, usa-se uma função sigmoid, representada como σ(z), que transforma o logit (z) em uma função de probabilidades (p), como demonstrado abaixo:

$σ(z) = p = (\frac{1}{1+e^{-x}})$

> No caso da regressão logística, o logit (z) é dado pela equação da combinação linear do intercepto e do coeficiente associado a variável(eis) explicativa(s) escolhida(s). Então temos que z é igual a:

$z = \beta0 + + \beta1X$

> Realizando essa manipulação matemática se torna possível encontrar a probabilidade prevista (p) para nosso exemplo, que é a prababilidade de passar no teste com base no tempo de estudo.

![1_Y3bIYkXXB9Ji_17TGqr-nw](https://github.com/user-attachments/assets/abcaa836-701c-4cec-b14a-ddca86e06d58)

Quando os valores de z forem negativos $(z → -∞)$, $e^{(-z)}$ vai tender $a + ∞$, resultando em uma probabilidade próxima de 0.

Exemplo: z = -1:

> σ(-1) = 1 / (1 + e^(-(-1)))
> 
> = 1 / (1 + e^(1))
> 
> ≈ 1 / (1 + 2.71828^(1))
> 
> ≈ 1 / (1 + 2.71828)
> 
> ≈ 1 / 3.71828
> 
> ≈ 0.269

Por outro lado, quando os valores de z forem positivos $(z → +∞)$, $e{(-z)}$ vai tender a 0, resultando em uma probabilidade próxima de 1.

Exemplo: z = 1:

> σ(1) = 1 / (1 + e^(-1))
> 
> ≈ 1 / (1 + 2.71828^(-1))
> 
> ≈ 1 / (1 + 0.36788)
> 
> ≈ 1 / 1.36788
> 
> ≈ 0.731

Essa propriedade da função permite que interpretemos a saída da função sigmoidal como probabilidades, onde valores próximos de 0 indicam uma baixa probabilidade de ocorrência do evento e valores próximos de 1 indicam uma alta probabilidade de ocorrência do evento.
Para classificar as probabilidades previstas como passar ou falhar, podemos definir um limite (por exemplo, 0,5). Se a probabilidade prevista estiver acima do limite, classificamos como passar; caso contrário, classificamos como falhar.

### Exemplo Prático
> O exemplo foi retirado do livro "*Microeconometrics: Methods and Applications, de Cameron e Trivedi (2010)*". No qual a base de dados é composta por beneficiários do Medicare (programa que fornece cobertura universal de seguro saúde para pessoas com mais de 65 anos ou para pessoas que aderiram ao programa de seguro por invalidez). Nessa base a variável dependete é (ins), que representa as pessoas que adquirem ou não seguro de saúde complementar (ins), sendo 1 = Sim e 0 = Não.

```r
logit ins age hisp educyear married retire hhincome hstatusg, robust
```
![Foto 1](https://github.com/user-attachments/assets/7faefb73-f5cd-4af1-9e85-0d140db4f262)

```r
estat class
# Correctly classified = 62.45%, isso significa que o modelo prever 62.45% das observações corretamente
```
![Foto 2](https://github.com/user-attachments/assets/a952f663-d08a-45e2-a1ed-e0dee8753b64)

> Ao analisarmos o Pseudo R2, obtivemos o reesultado de 0.0677, isso signifca que 6,77% da variação da variável depdente pode ser explicada pela variáveis explicativas do modelo, um valor relativamente baixo, então por isso análisamos a matriz de correlação das nossas variáveis

```r
pwcorr ins age hisp educyear married retire hhincome hstatusg, star(.1)
```
![Foto 3](https://github.com/user-attachments/assets/d1ce9928-c8e1-464e-8888-5520428ff234)

```r
ssc install heatplot
ssc install colrspace, replace	
ssc install palettes, replace

matrix C = r(C)
heatplot C
```
![Graph](https://github.com/user-attachments/assets/db55a9d5-adbe-49f9-bc35-33f699f0a1b4)

> Quando a variável explicativa apresentar (*), isso significa que temos uma correlação significativa com o nível de significancia definido. Sendo assimm, podemos concluir que:
- A variável dependente tem relação significativa com todas as variáveis explicativas 
- As variáveis Age e Retire tem correlação positiva e relativamente fraca. Os outros
- Já todos (*) da matriz de correlação não associados a variável dependente, representam a multicolinealidade entre as variáveis explicativas

#### Teste de Multicolinealidade 

```r
regress ins age hisp educyear married retire hhincome hstatusg
```

```r
vif
```
![Foto 4](https://github.com/user-attachments/assets/07135eff-8704-4e72-9057-0fedaf5786da)

- VIF < 10: VIF abaixo de 10 indicam que a multicolinearidade não é problemática
- VIF > 10: VIF maior que 10 sugere alta multicolinearidade

> No exemplo em questão temos que a multicolinearidade não é problemática

#### Interpretação dos Coeficientes

> "A variação no logit estimado para uma variação unitária da variável explicativa dada"

- Se a pessoa for hispânica o logit estimado diminui em -0.8103059 unidades
- Se a pessoa for casada o logit estimado (variável Y) aumenta em 0.578636 unidades

##### Convertendo para Chances (log-odds)

- e^(-0.8103059) = 0.4447 -> hisp
- e^(0.578636) = 1.7836 -> married

> Chances acima de 1 indicam maiores chances de um evento ocorrer e chances menores que 1, indicam menores chances de um evento ocorrer. Então as chances de a pessoa ter um plano de saúde complementar são menores se ela for hispânica, do que se ela não fosse hispânica, controlado pelo outros fatores. E as chances de a pessoa ter um plano de saúde complementar são maiores, sendo ela casada, do que se ela não fosse casada, controlado pelo outros fatores

> Quando os coeficientes tiverem o sinal negativo é comum para facilitar a interpretação dos resultados calcular seu inverso, ou seja: 

- 1 / e^(-0.8103059) = 2.2487 -> hisp

Nesse caso, se a pessoa for hispânica, as chances dela ter um plano de saúde complementar são em média 2.2487 vezes menores, do que se ela não fosse hispânica, controlado pelo outros fatores. Quando os coeficientes tiverem o sinal positivo não é necessário essa inversão. Sendo assim, se a pessoa for casada, as chances dela ter um plano de saúde complementar são em média .7836 vezes maiores, do que se ela não fosse casada, controlado pelo outros fatores.

##### Convertendo para Probabilidades Marginais (Efeito Marginal)

```r
mfx
```
![Foto 5](https://github.com/user-attachments/assets/fb78a993-65ff-44f1-8e74-c6f9cb72e4f5)

- Marginal effects after logit representa a probabilidade de se ter um plano de saúde complementar no ponto médio, ou seja, a probabilidade na média de se ter um plano de saúde complementar é 37,28%, controlado pelos outros fatores

##### Interpretação dos Coeficientes Alternativa (Odds Ratio)

```r
logistic ins age hisp educyear married retire hhincome hstatusg, robust
```
![Foto 0](https://github.com/user-attachments/assets/91d2fba6-cb3d-470a-950f-296fbf54634a)

- (0.4447 - 1) * 100 = -> hisp
- (1.7836 - 1) * 100 = -> married

> A chances da pessoa ter um plano de saúde complementar, sendo casada é 78,36% menor do que uma mulher solteira, controlado pelos outros fatores. E a chances da pessoa ter ter um plano de saúde complementar, sendo hispânica é -55,53% menor do que uma pessoa não hispância, controlado pelos outros fatores

#### Calculando a probabilidade para um ponto específico

```r
sort educyear
by educyear : sum ins
```

```r
sort married
by married: sum ins
```

```r
mfx, at(married=1 educyear=8)
```
![Foto 6](https://github.com/user-attachments/assets/7d11bbfa-4df2-424b-98a5-811b727d3127)

- Para esse perfil específico de pessoa, ter um plano de saúde complementar é de 30,07% em média, controlado pelos outros fatores

```r
# Probabilidade de cada pessoa ter um plano de saúde complementar
predict prob, p
list prob
```

#### Comparando Logit com Modelo de probabilidade linear (MPL)

```r
reg ins age hisp educyear married retire hhincome hstatusg, robust
```
![Foto 7](https://github.com/user-attachments/assets/a2fd20b2-eef0-4302-8a88-ce8147ea0531)

```r
estimates store mpl
```

```r
logit ins age hisp educyear married retire hhincome hstatusg, robust
```
![Foto 8](https://github.com/user-attachments/assets/24a0db7e-42ba-4561-b2fe-fb35a99f027a)

```r
estimates store logit
```

```r
estimates table mpl logit, b p
```
![10](https://github.com/user-attachments/assets/26abd0b7-bfed-4285-af97-0e7500a4a6d3)

