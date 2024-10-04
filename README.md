# Modelos Probabilísticos

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

*colocae grafico 

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
