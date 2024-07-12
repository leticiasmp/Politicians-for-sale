-- Média idade
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022)

SELECT ROUND(AVG(idade), 2) AS media_idade
FROM candidatos_eleitos

--Porcentagem de cada gênero
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, *
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT *
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato 
WHERE candidatos.ano = 2022),

total AS (SELECT COUNT(*) AS num_total
FROM candidatos_eleitos
WHERE genero IN ('masculino', 'feminino'))

SELECT genero, ROUND(((COUNT(genero)/total.num_total) * 100), 2) AS porcentagem_gen
FROM candidatos_eleitos, total
WHERE genero IN ('masculino', 'feminino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_gen DESC

-- Porcentagem de cada raça
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022),

tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM candidatos_eleitos), 

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2022 AND racas NOT IN ('nao informado'))

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2022 AND racas NOT IN ('nao informado')
GROUP BY racas, total.num_total
ORDER BY 2 DESC

-- Média receita declarada
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022), 

valor_candidatos AS (SELECT id_candidato_bd, SUM(valor_item) AS valor_total
FROM basedosdados.br_tse_eleicoes.bens_candidato 
WHERE id_candidato_bd IS NOT NULL
GROUP BY id_candidato_bd)

SELECT ROUND(AVG(valor_candidatos.valor_total), 2) AS media_receita
FROM valor_candidatos JOIN candidatos_eleitos ON candidatos_eleitos.id_candidato_bd = valor_candidatos.id_candidato_bd

-- Porcentagem de cada escolaridade
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022), 

total AS (SELECT COUNT(*) AS num_total 
FROM candidatos_eleitos 
WHERE instrucao IS NOT NULL)

SELECT instrucao, ROUND((COUNT(instrucao)/total.num_total * 100), 2) AS porcentagem_inst
FROM candidatos_eleitos, total
WHERE instrucao IS NOT NULL
GROUP BY instrucao, total.num_total
ORDER BY 2 DESC
