-- CANDIDATURAS
-- Mulheres - queries
-- Porcentagem de mulheres como deputadas federais;
SELECT genero, ROUND(((COUNT(candidatos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM basedosdados.br_tse_eleicoes.candidatos AS candidatos, (
    SELECT COUNT(*) AS num_total
    FROM basedosdados.br_tse_eleicoes.candidatos
    WHERE ano = 2022 AND cargo = 'deputado federal' AND genero IN ('feminino', 'masculino')) total
WHERE ano = 2022 AND cargo = 'deputado federal' AND genero IN ('feminino', 'masculino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC

-- Porcentagem de mulheres como deputadas estaduais/municipais;
SELECT genero, ROUND(((COUNT(candidatos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM basedosdados.br_tse_eleicoes.candidatos AS candidatos, (
    SELECT COUNT(*) AS num_total
    FROM basedosdados.br_tse_eleicoes.candidatos
    WHERE ano = 2022 AND cargo = 'deputado estadual' AND genero IN ('feminino', 'masculino')) total
WHERE ano = 2022 AND cargo = 'deputado estadual' AND genero IN ('feminino', 'masculino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC


-- Porcentagem de mulheres como senadoras;
SELECT genero, ROUND(((COUNT(candidatos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM basedosdados.br_tse_eleicoes.candidatos AS candidatos, (
    SELECT COUNT(*) AS num_total
    FROM basedosdados.br_tse_eleicoes.candidatos
    WHERE ano = 2022 AND cargo = 'senador' AND genero IN ('feminino', 'masculino')) total
WHERE ano = 2022 AND cargo = 'senador' AND genero IN ('feminino', 'masculino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC

-- Porcentagem de mulheres como governadoras;
SELECT genero, ROUND(((COUNT(candidatos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM basedosdados.br_tse_eleicoes.candidatos AS candidatos, (
    SELECT COUNT(*) AS num_total
    FROM basedosdados.br_tse_eleicoes.candidatos
    WHERE ano = 2022 AND cargo = 'governador' AND genero IN ('feminino', 'masculino')) total
WHERE ano = 2022 AND cargo = 'governador' AND genero IN ('feminino', 'masculino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC

-- Porcentagem de mulheres como prefeitas;
SELECT genero, ROUND(((COUNT(candidatos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM basedosdados.br_tse_eleicoes.candidatos AS candidatos, (
    SELECT COUNT(*) AS num_total
    FROM basedosdados.br_tse_eleicoes.candidatos
    WHERE ano = 2020 AND cargo = 'prefeito' AND genero IN ('feminino', 'masculino')) total
WHERE ano = 2020 AND cargo = 'prefeito' AND genero IN ('feminino', 'masculino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC


-- Porcentagem de mulheres como vereadoras.
SELECT genero, ROUND(((COUNT(candidatos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM basedosdados.br_tse_eleicoes.candidatos AS candidatos, (
    SELECT COUNT(*) AS num_total
    FROM basedosdados.br_tse_eleicoes.candidatos
    WHERE ano = 2020 AND cargo = 'vereador' AND genero IN ('feminino', 'masculino')) total
WHERE ano = 2020 AND cargo = 'vereador' AND genero IN ('feminino', 'masculino')
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC


-- Pessoas pretas e indígenas: 
-- Porcentagem de pessoas pretas e indígenas como deputadas federais;
WITH tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM `basedosdados.br_tse_eleicoes.candidatos`),

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2022 AND cargo = 'deputado federal' AND racas NOT IN ('nao informado'))

SELECT tabela_racas.racas, ROUND(((COUNT(tabela_racas.racas)/total.num_total) * 100), 2) AS porcentagem_raca
FROM tabela_racas, total
WHERE ano = 2022 AND cargo = 'deputado federal' AND racas NOT IN ('nao informado')
GROUP BY tabela_racas.racas, total.num_total
ORDER BY porcentagem_raca DESC



-- Porcentagem de pessoas pretas e indígenas como deputadas estaduais/municipais;
WITH tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM `basedosdados.br_tse_eleicoes.candidatos`),

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2022 AND cargo = 'deputado estadual' AND racas NOT IN ('nao informado'))

SELECT tabela_racas.racas, ROUND(((COUNT(tabela_racas.racas)/total.num_total) * 100), 2) AS porcentagem_raca
FROM tabela_racas, total
WHERE ano = 2022 AND cargo = 'deputado estadual' AND racas NOT IN ('nao informado')
GROUP BY tabela_racas.racas, total.num_total
ORDER BY porcentagem_raca DESC


-- Porcentagem de pessoas pretas e indígenas como senadoras;
WITH tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM `basedosdados.br_tse_eleicoes.candidatos`),

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2022 AND cargo = 'senador' AND racas NOT IN ('nao informado'))

SELECT tabela_racas.racas, ROUND(((COUNT(tabela_racas.racas)/total.num_total) * 100), 2) AS porcentagem_raca
FROM tabela_racas, total
WHERE ano = 2022 AND cargo = 'senador' AND racas NOT IN ('nao informado')
GROUP BY tabela_racas.racas, total.num_total
ORDER BY porcentagem_raca DESC


-- Porcentagem de pessoas pretas e indígenas como governadoras;
WITH tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM `basedosdados.br_tse_eleicoes.candidatos`),

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2022 AND cargo = 'governador' AND racas NOT IN ('nao informado'))

SELECT tabela_racas.racas, ROUND(((COUNT(tabela_racas.racas)/total.num_total) * 100), 2) AS porcentagem_raca
FROM tabela_racas, total
WHERE ano = 2022 AND cargo = 'governador' AND racas NOT IN ('nao informado')
GROUP BY tabela_racas.racas, total.num_total
ORDER BY porcentagem_raca DESC


-- Porcentagem de pessoas pretas e indígenas como prefeitas;
WITH tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM `basedosdados.br_tse_eleicoes.candidatos`),

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2020 AND cargo = 'prefeito' AND racas NOT IN ('nao informado'))

SELECT tabela_racas.racas, ROUND(((COUNT(tabela_racas.racas)/total.num_total) * 100), 2) AS porcentagem_raca
FROM tabela_racas, total
WHERE ano = 2020 AND cargo = 'prefeito' AND racas NOT IN ('nao informado')
GROUP BY tabela_racas.racas, total.num_total
ORDER BY porcentagem_raca DESC


-- Porcentagem de pessoas pretas e indígenas como vereadoras.
WITH tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM `basedosdados.br_tse_eleicoes.candidatos`),

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2020 AND cargo = 'vereador' AND racas NOT IN ('nao informado'))

SELECT tabela_racas.racas, ROUND(((COUNT(tabela_racas.racas)/total.num_total) * 100), 2) AS porcentagem_raca
FROM tabela_racas, total
WHERE ano = 2020 AND cargo = 'vereador' AND racas NOT IN ('nao informado')
GROUP BY tabela_racas.racas, total.num_total
ORDER BY porcentagem_raca DESC

-- ELEITOS
-- Mulheres - queries: 
-- Porcentagem de mulheres como deputadas federais;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022 AND cargo = 'deputado federal' AND genero IN ('feminino', 'masculino'))

SELECT genero, ROUND(((COUNT(candidatos_eleitos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM candidatos_eleitos, (
    SELECT COUNT(*) AS num_total
    FROM candidatos_eleitos) total
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC


-- Porcentagem de mulheres como deputadas estaduais/municipais;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022 AND cargo = 'deputado estadual' AND genero IN ('feminino', 'masculino'))

SELECT genero, ROUND(((COUNT(candidatos_eleitos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM candidatos_eleitos, (
    SELECT COUNT(*) AS num_total
    FROM candidatos_eleitos) total
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC



-- Porcentagem de mulheres como senadoras;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022 AND cargo = 'senador' AND genero IN ('feminino', 'masculino'))

SELECT genero, ROUND(((COUNT(candidatos_eleitos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM candidatos_eleitos, (
    SELECT COUNT(*) AS num_total
    FROM candidatos_eleitos) total
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC


-- Porcentagem de mulheres como governadoras;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2022 AND cargo = 'governador' AND genero IN ('feminino', 'masculino'))

SELECT genero, ROUND(((COUNT(candidatos_eleitos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM candidatos_eleitos, (
    SELECT COUNT(*) AS num_total
    FROM candidatos_eleitos) total
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC

-- Porcentagem de mulheres como prefeitas;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2020 AND cargo = 'prefeito' AND genero IN ('feminino', 'masculino'))

SELECT genero, ROUND(((COUNT(candidatos_eleitos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM candidatos_eleitos, (
    SELECT COUNT(*) AS num_total
    FROM candidatos_eleitos) total
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC

-- Porcentagem de mulheres como vereadoras.
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2020 AND cargo = 'vereador' AND genero IN ('feminino', 'masculino'))

SELECT genero, ROUND(((COUNT(candidatos_eleitos.genero)/total.num_total) * 100), 2) AS porcentagem_genero
FROM candidatos_eleitos, (
    SELECT COUNT(*) AS num_total
    FROM candidatos_eleitos) total
GROUP BY genero, total.num_total
ORDER BY porcentagem_genero DESC


-- Pessoas pretas:
-- Porcentagem de pessoas pretas como deputadas federais;
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
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'deputado federal')

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'deputado federal'
GROUP BY racas, total.num_total
ORDER BY porcentagem_rac DESC


-- Porcentagem de pessoas pretas como deputadas estaduais/municipais;
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
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'deputado estadual')

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'deputado estadual'
GROUP BY racas, total.num_total
ORDER BY porcentagem_rac DESC

-- Porcentagem de pessoas pretas como senadoras;
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
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'senador')

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'senador'
GROUP BY racas, total.num_total
ORDER BY porcentagem_rac DESC


-- Porcentagem de pessoas pretas como governadoras;
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
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'governador')

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2022 AND racas NOT IN ('nao informado') AND cargo = 'governador'
GROUP BY racas, total.num_total
ORDER BY porcentagem_rac DESC


-- Porcentagem de pessoas pretas como prefeitas;

WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2020),

tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM candidatos_eleitos), 

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2020 AND racas NOT IN ('nao informado') AND cargo = 'prefeito')

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2020 AND racas NOT IN ('nao informado') AND cargo = 'prefeito'
GROUP BY racas, total.num_total
ORDER BY porcentagem_rac DESC


-- Porcentagem de pessoas pretas como vereadoras.
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

candidatos_eleitos AS (SELECT candidatos.*
FROM basedosdados.br_tse_eleicoes.candidatos JOIN resultado_eleicoes ON candidatos.id_candidato_bd = resultado_eleicoes.id_candidato
WHERE candidatos.ano = 2020),

tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM candidatos_eleitos), 

total AS (SELECT COUNT(tabela_racas.racas) AS num_total
FROM tabela_racas
WHERE ano = 2020 AND racas NOT IN ('nao informado') AND cargo = 'vereador')

SELECT racas, ROUND((COUNT(tabela_racas.racas)/total.num_total * 100), 2) AS porcentagem_rac
FROM tabela_racas, total
WHERE ano = 2020 AND racas NOT IN ('nao informado') AND cargo = 'vereador'
GROUP BY racas, total.num_total
ORDER BY porcentagem_rac DESC
