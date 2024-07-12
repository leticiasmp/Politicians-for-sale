-- Valor total em doações
SELECT origem_receita, COUNT(*) as numero_doacoes, ROUND(SUM(valor_receita), 2) AS valor_doacoes 
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2022
GROUP BY origem_receita
ORDER BY 2 DESC

-- Média de valor por doação de pessoa física
SELECT ROUND(AVG(valor_receita), 2) AS media_receita
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'

-- 10 doadores que somaram o maior valor doado e o valor;
SELECT cpf_cnpj_doador, SUM(valor_receita) valor_total, 
  CASE WHEN nome_doador = 'JOSÉ SALIM MATTAR JUNIOR' THEN 'JOSE SALIM MATTAR JUNIOR'
  ELSE nome_doador
  END AS nomes_doadores
FROM basedosdados.br_tse_eleicoes.receitas_candidato
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'
GROUP BY receitas_candidato.cpf_cnpj_doador, nomes_doadores
ORDER BY valor_total DESC
LIMIT 10


-- Porcentagem do total do número de políticos que receberam 80% dos investimentos
WITH 

porcentagem_cand AS (SELECT ano, id_candidato_bd, nome_candidato, ((SUM(valor_receita)/total.valor_total) * 100) AS porc_doacao
FROM basedosdados.br_tse_eleicoes.receitas_candidato, (
  SELECT SUM(valor_receita) AS valor_total 
  FROM basedosdados.br_tse_eleicoes.receitas_candidato
  WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas') total
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'
GROUP BY ano, id_candidato_bd, nome_candidato, total.valor_total
ORDER BY porc_doacao DESC),

soma_cum_cand AS (SELECT nome_candidato, SUM(porc_doacao) OVER(PARTITION BY ano ORDER BY porc_doacao DESC) AS sum_porc
FROM porcentagem_cand),

restr_porc AS (SELECT nome_candidato, sum_porc
FROM soma_cum_cand
WHERE sum_porc <= 80)

SELECT ROUND((COUNT(restr_porc.nome_candidato)/total.num_total * 100), 2) AS porcentagem
FROM restr_porc, (SELECT COUNT(nome_candidato) AS num_total
FROM (SELECT nome_candidato
FROM basedosdados.br_tse_eleicoes.receitas_candidato 
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'
GROUP BY nome_candidato) total_cand) total
GROUP BY total.num_total


-- Porcentagem de doações para categorias: mulheres pretas, mulheres brancas, homens pretos e homens brancos.
WITH

total_cand AS (SELECT receitas_candidato.valor_receita, receitas_candidato.id_candidato_bd AS id_cand, candidatos.cpf, candidatos.raca, candidatos.genero, candidatos.id_candidato_bd
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN basedosdados.br_tse_eleicoes.candidatos ON candidatos.id_candidato_bd = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND candidatos.ano = 2022 AND receitas_candidato.origem_receita = 'recursos de pessoas fisicas'),

cands_2022 AS (SELECT cpf, raca, genero, SUM(valor_receita) AS valor_total
FROM total_cand
GROUP BY 1, 2, 3),

tabela_raca_genero AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') AND genero = 'feminino' THEN 'mulher nao branca'
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') AND genero = 'masculino' THEN 'homem nao branco'
  WHEN raca IN ('branca') AND genero = 'feminino' THEN 'mulher branca'
  WHEN raca IN ('branca') AND genero = 'masculino' THEN 'homem branco'
  ELSE 'nao informado'
 END AS raca_genero
FROM cands_2022) 

SELECT raca_genero, ROUND(AVG(valor_total), 2) AS media_receita
FROM tabela_raca_genero
WHERE raca_genero NOT IN ('nao informado')
GROUP BY raca_genero
ORDER BY 2 DESC




-- Média de investimentos por candidato - queries: 
		SELECT ROUND(AVG(valor_total), 2) AS media_candidato
FROM (SELECT cpf_candidato, ano, SUM(valor_receita) AS valor_total
FROM basedosdados.br_tse_eleicoes.receitas_candidato
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'
GROUP BY 1, 2
ORDER BY 1 DESC) cands_2022

-- Média de investimento por candidato por raça - preta e branca;
WITH

total_cand AS (SELECT receitas_candidato.valor_receita, receitas_candidato.id_candidato_bd AS id_cand, candidatos.cpf, candidatos.raca, candidatos.id_candidato_bd
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN basedosdados.br_tse_eleicoes.candidatos ON candidatos.id_candidato_bd = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND candidatos.ano = 2022 AND receitas_candidato.origem_receita = 'recursos de pessoas fisicas'),

cands_2022 AS (SELECT cpf, raca, SUM(valor_receita) AS valor_total
FROM total_cand
GROUP BY 1, 2),

tabela_racas AS (SELECT *, CASE
  WHEN raca IN ('indigena', 'parda', 'preta', 'amarela') THEN 'nao branca'
  WHEN raca IN ('nao informado', NULL) THEN 'nao informado'
  ELSE 'branca'
 END AS racas
FROM cands_2022) 

SELECT racas, ROUND(AVG(valor_total), 2) AS media_receita
FROM tabela_racas
WHERE racas NOT IN ('nao informado')
GROUP BY racas
ORDER BY 2 DESC

-- Média de investimento por candidato por gênero - homem e mulher;
WITH

total_cand AS (SELECT receitas_candidato.valor_receita, receitas_candidato.id_candidato_bd AS id_cand, candidatos.cpf, candidatos.genero, candidatos.id_candidato_bd
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN basedosdados.br_tse_eleicoes.candidatos ON candidatos.id_candidato_bd = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND candidatos.ano = 2022 AND receitas_candidato.origem_receita = 'recursos de pessoas fisicas'),

cands_2022 AS (SELECT cpf, genero, SUM(valor_receita) AS valor_total
FROM total_cand
WHERE genero IN ('masculino', 'feminino')
GROUP BY 1, 2)

SELECT genero, ROUND(AVG(valor_total), 2) AS media_receita
FROM cands_2022
GROUP BY genero
ORDER BY media_receita DESC


-- Partido que mais receberam doações: 
-- 10 partidos que somaram o maior valor em investimentos;
SELECT sigla_partido, ROUND(SUM(valor_receita), 2) AS valor_invest
FROM basedosdados.br_tse_eleicoes.receitas_candidato
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'
GROUP BY sigla_partido
ORDER BY valor_invest DESC
LIMIT 10
