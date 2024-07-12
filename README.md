# ETAPAS PROJETO

## Limpeza de dados e preparação

A limpeza e preparação dos dados foi realizada em três passos:

1. Para a definição dos dados que seriam coletados para projeto, busquei primeiramente entender a relação entre as tabelas presentes no dataset `br_tse_eleicoes` juntamente com os dados presentes em cada uma delas.
   - Atividades principais: identificação das Primary e Foreign Keys, análise de dados duplicados e identificação de valores nulos e inválidos.
2. Identifiquei os critérios utilizados para o armazenamento de cada um dos dados dentro das tabelas.
   - Atividades principais: análise dos dados computados por meio de queries SQL.
3. Filtragem dos dados de acordo com as amostras a serem estudadas sendo elas: eleições 2020 e eleições 2022.
   - Atividades principais: execução de condições para filtragem dos dados a serem estudados por meio de queries SQL.

Para mais, vale ressaltar que os dados dispostos pelo Tribunal Superior Eleitoral não possuem organização rigorosa, o que faz com que alguns dados tenham uma grande complexidade de limpeza. Desta forma, devemos considerar uma margem de erro de 2 pontos percentuais para os dados aqui expostos.

## Análises e visualização

Assim, com base nos conhecimentos adquiridos na etapa anterior busquei dados que elucidassem a questão:

**Qual o impacto dos investimentos de grandes empresários em campanhas eleitorais na nossa democracia? Como isso reflete-se em nossa sociedade?**

Desta forma, por meio da análise prévia dos dados, podemos concluir que a única métrica de sucesso que teríamos disponível seria o resultado das eleições e o número de votos. Assim, tomamos como objeto de estudos:

### CONTEXTO

- Contexto dos políticos eleitos por nível de instrução, média de idade, gênero e receita declarada.

### REPRESENTATIVIDADE

- Representação nas candidaturas de deputado federal, deputado estadual, senadores, governadores e prefeitos por gênero.
- Representação nas candidaturas para deputado federal, deputado estadual, senador, governador, prefeito e vereador por raça.
- Representação nas eleições de deputados federais, deputados estaduais, senadores, governadores, prefeitos e vereadores por gênero.
- Representação nas eleições de deputados federais, deputados estaduais, senadores, governadores, prefeitos e vereadores por raça.

### INVESTIMENTOS EM CANDIDATURAS

- Valores investidos nas candidaturas por fundo eleitoral vs doações de pessoas físicas.
- Média de valor doado por pessoa física.
- 10 principais doadores das eleições de 2022.
- Porcentagem dos políticos que receberam 80% dos investimentos por pessoa física.
- Média de investimento por candidato em geral.
- Média de investimento por candidato por raça.
- Média de investimento por candidato por gênero.
- Média de investimento por candidato por raça e gênero.
- 10 partidos que mais receberam investimentos de pessoas físicas.

### INVESTIMENTOS POR CANDIDATOS ELEITOS E NÃO ELEITOS

- Média de investimento para deputado federal eleito vs deputado federal não eleito.
- Média de investimento para deputado estadual eleito vs deputado estadual não eleito.
- Média de investimento para senador eleito vs senador não eleito.
- Média de investimento para governador eleito vs governador não eleito.
- Média de investimento para prefeito eleito vs prefeito não eleito.
- Média de investimento por candidato eleito em geral vs por candidato em geral não eleito em 2022.

## Principais insights encontrados

**Os políticos eleitos não representam a sociedade brasileira e suas demandas**
- Os candidatos eleitos não refletem a diversidade da sociedade, configurando um cenário político majoritariamente formado por homens brancos ricos excluindo minorias como mulheres e pessoas pretas.
- Na corrida contra a desigualdade de gênero, temos um padrão na média de eleições para mulheres de 15% contra 85% de homens. Sendo que no cargo de governador chegamos a um cenário mais crítico com 7,69% de mulheres contra 92,31% de homens.
- Ao tratarmos da desigualdade racial, temos nas candidaturas um cenário onde em alguns cargos atingimos quase 50% para pessoas brancas e 50% para pessoas não-brancas(indígenas, amarelos, pardos e pretos) porém ao tratarmos de candidatos eleitos temos uma tendência aproximada em média de 30% para pessoas não-brancas contra 70% para pessoas brancas.

**Empresários tomam candidatos como investimentos para obter recursos públicos**
- Os 10 principais doadores das eleições de 2022 são advogados, pastores e empresários do setor calçadista, automotivo, pecuária e saúde, sendo que os valores doados por estes resultam em uma média de R$3.296.259,27.

**A desigualdade de recursos nas candidaturas impacta as classes menos favorecidas na sociedade e favorece as classes dominantes**
- Ao analisarmos as doações realizadas por pessoas físicas, temos como público que menos recebeu doações as mulheres pretas possuindo valor médio de doações 4x menor que o público que mais recebeu doações sendo ele composto de homens brancos. O cenário reflete em nossa sociedade, já que as mulheres pretas compõem a classe que mais sofre com a desigualdade social.

**A disponibilidade de recursos influenciam o número de votos**
- Os investimentos nas campanhas eleitorais impactam no número de votos, uma vez que os recursos dos candidatos eleitos em geral no ano de 2022 atingem um valor quase 7 vezes maior do que dos candidatos não eleitos.
- Simone Tebet é o exemplo claro do impacto destes na tomada de decisão, tendo iniciado sua campanha com 2% de intenção de votos e terminado com 5% de intenção de voto.

### Sugestões com base nesse

- Implementação de lei que limite o valor das doações para uma quantia fixa e não proporcional a renda bruta de cada pessoa.
- Fiscalização das quantias doadas para cada político estabelecendo um limite de doação de forma a equiparar os recursos destes com os demais políticos não permitindo que haja uma discrepância alarmante entre os candidatos.
- Acompanhamento das ações políticas das pessoas que mais doaram recursos na campanhas eleitorais de políticos eleitos.
- Estabelecimento de cotas para eleições de políticos de acordo com as minorias presentes na sociedade de forma mais efetiva do que a atual política de cota para gênero estabelecida em cima das candidaturas.
